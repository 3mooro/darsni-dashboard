DROP TABLE IF EXISTS site_settings;
CREATE TABLE site_settings (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  hero_title TEXT,
  hero_subtitle TEXT,
  hero_image TEXT,
  phone_number TEXT,
  whatsapp_number TEXT,
  stats_students INTEGER,
  stats_courses INTEGER,
  stats_success_rate INTEGER,
  stats_tools INTEGER,
  about_text TEXT
);

DROP TABLE IF EXISTS courses;
CREATE TABLE courses (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  slug TEXT UNIQUE,
  title TEXT,
  instructor TEXT,
  rating REAL,
  image TEXT,
  tag TEXT,
  level TEXT,
  display_order INTEGER,
  packages JSON,
  syllabus JSON,
  body TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS blog;
CREATE TABLE blog (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  slug TEXT UNIQUE,
  title TEXT,
  description TEXT,
  pubDate TEXT,
  heroImage TEXT,
  author TEXT DEFAULT 'أكاديمية درسني',
  readingTime TEXT DEFAULT '5 دقائق',
  tags JSON,
  body TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS students;
CREATE TABLE students (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  customer_name TEXT,
  phone TEXT,
  course_requested TEXT,
  status TEXT DEFAULT 'جديد',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS admins;
CREATE TABLE admins (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE,
  password TEXT
);

INSERT INTO admins (username, password) VALUES ('admin', 'Omar123');
INSERT INTO site_settings (hero_title, hero_subtitle, phone_number, whatsapp_number, stats_students, stats_courses, stats_success_rate, stats_tools, about_text) 
VALUES ('أكاديمية درسني', 'منصتك التعليمية الأفضل للتفوق والنجاح', '966500000000', '966500000000', 10000, 250, 98, 50, 'أكاديمية متخصصة تقدم أفضل الدورات بأحدث التقنيات.');
