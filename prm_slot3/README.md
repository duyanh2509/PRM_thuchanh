# PRM Slot 3 - Data Layer Simulation

## Practice Task
**Goal: Build data layer simulation using Dart**

### ✅ Yêu cầu đã hoàn thành:
- ✅ Create Product model
- ✅ Create repository returning:
  - `Future<List<Product>>` - Async data fetching
  - `Stream<Product>` (live add) - Real-time updates
- ✅ Print to console

## 📁 Cấu trúc project:
```
prm_slot3/
├── lib/
│   ├── models/
│   │   └── product.dart          # Product model class
│   ├── repositories/
│   │   └── product_repository.dart  # Repository with Future & Stream
│   └── main.dart                 # Main demo program
├── pubspec.yaml
├── analysis_options.yaml
└── README.md
```

## 🚀 Cách chạy:

```bash
# Di chuyển vào thư mục prm_slot3
cd d:\PRM393\PRM_thuchanh\prm_slot2\prm\prm_slot3

# Chạy chương trình
dart run lib/main.dart
```

## 📚 Kiến thức áp dụng:

### 1. **Product Model**
- Class với properties: id, name, price, description, category
- Methods: `toString()`, `toMap()`, `fromMap()`

### 2. **Product Repository**
- **Future methods** (async operations):
  - `getAllProducts()` - Lấy tất cả sản phẩm
  - `getProductsByCategory()` - Lọc theo category
  - `getProductById()` - Tìm theo ID
  
- **Stream** (real-time updates):
  - `productStream` - Stream để lắng nghe sản phẩm mới
  - `addProduct()` - Thêm sản phẩm và emit vào stream
  - `simulateLiveProductAddition()` - Mô phỏng thêm sản phẩm theo thời gian

### 3. **Main Program**
- Demo đầy đủ các tính năng
- Sử dụng `async/await` cho Future
- Sử dụng `listen()` cho Stream
- In kết quả ra console

## 🎯 Output mẫu:
```
═══════════════════════════════════════════════════════
   🎯 PRACTICE TASK: Data Layer Simulation using Dart
═══════════════════════════════════════════════════════

📋 TASK 1: Fetch all products using Future
📦 Fetching all products from database...
✅ Successfully fetched 5 products:
  • Product(id: 1, name: iPhone 15 Pro, price: $999.99, category: Electronics)
  • Product(id: 2, name: Samsung Galaxy S24, price: $899.99, category: Electronics)
  ...

📋 TASK 4: Listen to product stream (live add)
🔔 NEW PRODUCT ADDED (via Stream):
   → Product(id: 6, name: Apple Watch Series 9, price: $399.99, category: Wearables)
```

## 💡 Ghi chú
- Sử dụng `Future.delayed()` để mô phỏng network delay
- Sử dụng `StreamController` để quản lý Stream
- Sử dụng `Timer` để mô phỏng live data
- Nhớ gọi `dispose()` để clean up resources
