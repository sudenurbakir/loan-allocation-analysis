# Business Rules

## 1. Genel Bakış

Business Rules, kredi başvuru ve tahsis sürecinde sistemin karar üretirken dikkate alacağı iş kurallarını tanımlamaktadır.

Bu projede kullanılan tüm değerler ve kriterler kurgusal olup yalnızca analiz çalışmasının gösterilmesi amacıyla oluşturulmuştur.

## 2. Kredi Başvuru Kuralları

### BR-001 — Zorunlu Bilgi

Kredi başvurusunun oluşturulabilmesi için sistem tarafından zorunlu olarak tanımlanan tüm bilgilerin eksiksiz girilmesi gerekir.

---

### BR-002 — Gelir Bilgisi

Müşterinin aylık gelir bilgisi sıfır veya negatif bir değer olamaz.

---

### BR-003 — Yaş Kriteri

Kredi başvurusu yapabilmek için müşterinin en az 18 yaşında olması gerekir.

---

### BR-004 — Aktif Başvuru

Bir müşterinin aynı kredi ürünü için sonuçlanmamış bir başvurusu bulunuyorsa aynı ürün için yeni bir başvuru oluşturmasına izin verilmemelidir.

## 3. Kredi Tahsis Kuralları

### BR-005 — Minimum Kredi Skoru

Kredi skorunun 1200'ün altında olması durumunda başvuru otomatik olarak reddedilmelidir.

---

### BR-006 — Gelir / Taksit Oranı

Aylık kredi taksitinin müşterinin aylık gelirinin %50'sinden fazla olması durumunda başvuru reddedilmelidir.

---

### BR-007 — Kredi Tutarı

Talep edilen kredi tutarı, müşterinin ilgili kredi ürünü için belirlenen maksimum kredi limitini aşmamalıdır.

---

### BR-008 — Uygunluk

Müşteri tüm temel uygunluk kriterlerini sağlıyorsa kredi başvurusu değerlendirme aşamasına alınmalıdır.

---

### BR-009 — Otomatik Red

Aşağıdaki durumlardan herhangi biri gerçekleşirse kredi başvurusu otomatik olarak reddedilmelidir:

* Müşteri yaş kriterini karşılamıyorsa
* Kredi skoru minimum değerin altındaysa
* Aylık taksit / gelir oranı %50'yi aşıyorsa
* Talep edilen kredi tutarı ürün limitini aşıyorsa

---

### BR-010 — Kredi Teklifi

Kredi başvurusu onaylandığında sistem müşteriye uygun kredi teklifini oluşturmalıdır.

## 4. Karar Mantığı

Kredi tahsis süreci aşağıdaki temel karar mantığına göre çalışmaktadır:

```text
Başvuru
   ↓
Bilgiler eksiksiz mi?
   ├── Hayır → Başvuruyu tamamlat
   └── Evet
          ↓
Yaş >= 18?
   ├── Hayır → Reject
   └── Evet
          ↓
Kredi skoru >= 1200?
   ├── Hayır → Reject
   └── Evet
          ↓
Taksit / Gelir <= %50?
   ├── Hayır → Reject
   └── Evet
          ↓
Kredi tutarı ürün limitinde mi?
   ├── Hayır → Reject
   └── Evet
          ↓
      Approved
```

## 5. Business Rule Önceliği

Business Rules, kredi başvuru sürecinde belirlenen gereksinimlerin nasıl uygulanacağını açıklamakta ve kredi tahsis kararının oluşturulmasında temel karar kriterlerini sağlamaktadır.
