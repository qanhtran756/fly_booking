import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('flybetter.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
      onConfigure: (db) async {
        // Bật tính năng khóa ngoại (Foreign Key)
        await db.execute('PRAGMA foreign_keys = ON');
      },
    );
  }

  Future _createDB(Database db, int version) async {
    // 1. Bảng Users (Quản lý tài khoản & phân quyền)
    await db.execute('''
      CREATE TABLE Users (
        user_id INTEGER PRIMARY KEY AUTOINCREMENT,
        full_name TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        phone TEXT,
        password_hash TEXT NOT NULL,
        role TEXT NOT NULL,
        created_at TEXT DEFAULT CURRENT_TIMESTAMP
      )
    ''');

    // 2. Bảng Airlines (Hãng hàng không)
    await db.execute('''
      CREATE TABLE Airlines (
        airline_id TEXT PRIMARY KEY,
        airline_name TEXT NOT NULL,
        logo_url TEXT
      )
    ''');

    // 3. Bảng Airports (Sân bay)
    await db.execute('''
      CREATE TABLE Airports (
        airport_code TEXT PRIMARY KEY,
        airport_name TEXT NOT NULL,
        city TEXT NOT NULL,
        country TEXT NOT NULL
      )
    ''');

    // 4. Bảng Flights (Chuyến bay)
    await db.execute('''
      CREATE TABLE Flights (
        flight_id INTEGER PRIMARY KEY AUTOINCREMENT,
        flight_number TEXT NOT NULL,
        airline_id TEXT,
        departure_airport TEXT,
        arrival_airport TEXT,
        departure_time TEXT NOT NULL,
        arrival_time TEXT NOT NULL,
        base_price REAL NOT NULL,
        status TEXT DEFAULT 'Scheduled',
        FOREIGN KEY (airline_id) REFERENCES Airlines (airline_id),
        FOREIGN KEY (departure_airport) REFERENCES Airports (airport_code),
        FOREIGN KEY (arrival_airport) REFERENCES Airports (airport_code)
      )
    ''');

    // 5. Bảng FlightSeats (Ghế trên chuyến bay)
    await db.execute('''
      CREATE TABLE FlightSeats (
        seat_id INTEGER PRIMARY KEY AUTOINCREMENT,
        flight_id INTEGER,
        seat_number TEXT NOT NULL,
        seat_class TEXT NOT NULL,
        price REAL NOT NULL,
        is_booked INTEGER DEFAULT 0,
        FOREIGN KEY (flight_id) REFERENCES Flights (flight_id)
      )
    ''');

    // 6. Bảng Vouchers (Mã giảm giá)
    await db.execute('''
      CREATE TABLE Vouchers (
        voucher_id INTEGER PRIMARY KEY AUTOINCREMENT,
        code TEXT UNIQUE NOT NULL,
        discount_percent REAL,
        max_discount REAL,
        expiry_date TEXT,
        quantity INTEGER
      )
    ''');

    // 7. Bảng Bookings (Đơn đặt vé)
    await db.execute('''
      CREATE TABLE Bookings (
        booking_id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER,
        booking_date TEXT DEFAULT CURRENT_TIMESTAMP,
        total_amount REAL NOT NULL,
        voucher_id INTEGER,
        payment_status TEXT DEFAULT 'Pending',
        FOREIGN KEY (user_id) REFERENCES Users (user_id),
        FOREIGN KEY (voucher_id) REFERENCES Vouchers (voucher_id)
      )
    ''');

    // 8. Bảng Tickets (Chi tiết vé hành khách)
    await db.execute('''
      CREATE TABLE Tickets (
        ticket_id INTEGER PRIMARY KEY AUTOINCREMENT,
        booking_id INTEGER,
        flight_id INTEGER,
        seat_id INTEGER,
        passenger_name TEXT NOT NULL,
        passenger_id_card TEXT NOT NULL,
        ticket_status TEXT DEFAULT 'Active',
        check_in_status INTEGER DEFAULT 0,
        FOREIGN KEY (booking_id) REFERENCES Bookings (booking_id),
        FOREIGN KEY (flight_id) REFERENCES Flights (flight_id),
        FOREIGN KEY (seat_id) REFERENCES FlightSeats (seat_id)
      )
    ''');

    // 9. Bảng Payments (Lịch sử thanh toán)
    await db.execute('''
      CREATE TABLE Payments (
        payment_id INTEGER PRIMARY KEY AUTOINCREMENT,
        booking_id INTEGER,
        payment_method TEXT NOT NULL,
        amount REAL NOT NULL,
        transaction_code TEXT,
        payment_date TEXT DEFAULT CURRENT_TIMESTAMP,
        status TEXT DEFAULT 'Pending',
        FOREIGN KEY (booking_id) REFERENCES Bookings (booking_id)
      )
    ''');
  }

  // Đóng database khi không dùng
  Future close() async {
  final db = await instance.database;
    db.close();
  }
}