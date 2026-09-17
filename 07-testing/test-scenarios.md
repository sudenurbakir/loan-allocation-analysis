# Test Scenarios – Loan Allocation System

## 1. Amaç

Bu dokümanın amacı, dijital kredi başvuru ve kredi tahsis sürecinde test edilmesi gereken temel senaryoları tanımlamaktır.

Test senaryoları;

* Functional Testing
* Frontend Testing
* Backend/API Testing
* Database Testing
* Business Rule Testing
* Negative Testing

kapsamında hazırlanmıştır.

> Bu projedeki test senaryoları tamamen kurgusal bir sistem üzerinden hazırlanmıştır.

---

# 2. Test Kapsamı

Test kapsamında aşağıdaki süreçler ele alınmaktadır:

```text
Kredi Başvurusu
       |
       v
Form Validasyonu
       |
       v
Başvuru Oluşturma
       |
       v
Uygunluk Kontrolü
       |
       v
Kredi Tahsis Değerlendirmesi
       |
       v
Onay / Red
       |
       v
Kredi Teklifi
```

---

# 3. Test Senaryoları

| Scenario ID | Test Alanı    | Senaryo                                              | Beklenen Sonuç                           |
| ----------- | ------------- | ---------------------------------------------------- | ---------------------------------------- |
| TS-001      | Frontend      | Kullanıcı geçerli bilgiler ile kredi başvurusu yapar | Başvuru başarıyla gönderilir             |
| TS-002      | Frontend      | Zorunlu alan boş bırakılır                           | Kullanıcıya validasyon mesajı gösterilir |
| TS-003      | Frontend      | Geçersiz tutar girilir                               | Kullanıcıya hata mesajı gösterilir       |
| TS-004      | Frontend      | Geçersiz vade girilir                                | Kullanıcıya hata mesajı gösterilir       |
| TS-005      | Backend       | Geçerli request gönderilir                           | API 201 Created döner                    |
| TS-006      | Backend       | Eksik alan içeren request gönderilir                 | API 400 Bad Request döner                |
| TS-007      | Backend       | Olmayan müşteri ID'si gönderilir                     | API 404 Not Found döner                  |
| TS-008      | Backend       | Aynı müşteri için aktif başvuru gönderilir           | API 409 Conflict döner                   |
| TS-009      | Business Rule | 18 yaşından küçük müşteri başvurur                   | Başvuru reddedilir                       |
| TS-010      | Business Rule | Kredi skoru minimum değerin altındadır               | Başvuru reddedilir                       |
| TS-011      | Business Rule | Taksit/gelir oranı %50'yi aşar                       | Başvuru reddedilir                       |
| TS-012      | Business Rule | Talep edilen tutar ürün limitini aşar                | Başvuru reddedilir                       |
| TS-013      | Business Rule | Tüm kriterler sağlanır                               | Başvuru onaylanır                        |
| TS-014      | Database      | Başvuru oluşturulur                                  | Database'e kayıt eklenir                 |
| TS-015      | Database      | Başvuru oluşturulduğunda status kontrol edilir       | Status `SUBMITTED` olarak kaydedilir     |
| TS-016      | Database      | Kredi kararı oluşturulur                             | Decision kaydı oluşturulur               |
| TS-017      | API           | Başvuru durumu sorgulanır                            | Güncel başvuru durumu döner              |
| TS-018      | API           | Olmayan başvuru sorgulanır                           | API 404 döner                            |
| TS-019      | Integration   | Başvuru oluşturma sonrası Application ID döner       | Frontend'e doğru ID iletilir             |
| TS-020      | Integration   | Onaylanan başvuru için teklif oluşturulur            | Loan offer oluşturulur                   |

---

# 4. Frontend Test Senaryoları

## TS-001 – Geçerli Kredi Başvurusu

**Amaç:** Kullanıcının geçerli bilgiler ile başvuru oluşturabildiğini doğrulamak.

**Ön Koşul:**

* Kullanıcı sistemde kayıtlıdır.
* Kredi ürünü aktiftir.

**Test Verisi:**

```text
Müşteri ID: 1001
Ürün ID: 101
Kredi Tutarı: 75.000
Vade: 24 ay
```

**Beklenen Sonuç:**

Kullanıcı başvuru formunu başarıyla gönderir ve başvuru oluşturulur.

---

## TS-002 – Zorunlu Alan Kontrolü

**Amaç:** Zorunlu alanların boş bırakılması durumunda kullanıcıya hata verilmesini doğrulamak.

**Adımlar:**

1. Kredi başvuru ekranı açılır.
2. Zorunlu alanlardan biri boş bırakılır.
3. Başvuru butonuna tıklanır.

**Beklenen Sonuç:**

Sistem ilgili alanın doldurulması gerektiğini belirtir ve başvurunun gönderilmesine izin vermez.

---

## TS-003 – Geçersiz Kredi Tutarı

**Test Verisi:**

```text
Kredi Tutarı: -5000
```

**Beklenen Sonuç:**

Sistem negatif kredi tutarını kabul etmez ve kullanıcıya uygun hata mesajı gösterir.

---

## TS-004 – Geçersiz Vade

**Test Verisi:**

```text
Vade: 0
```

**Beklenen Sonuç:**

Sistem 0 veya negatif vade değerini kabul etmez.

---

# 5. Backend / API Test Senaryoları

## TS-005 – Başarılı API Request

**Endpoint:**

```http
POST /api/loan-applications
```

**Beklenen Sonuç:**

```text
HTTP 201 Created
```

Response içerisinde `applicationId` ve `status` alanları bulunmalıdır.

---

## TS-006 – Eksik Alan

**Request:**

```json
{
  "customerId": 1001,
  "productId": 101
}
```

**Beklenen Sonuç:**

```text
HTTP 400 Bad Request
```

Eksik alan hakkında açıklayıcı bir hata mesajı dönmelidir.

---

## TS-007 – Olmayan Müşteri

**Request:**

```json
{
  "customerId": 999999,
  "productId": 101,
  "requestedAmount": 75000,
  "requestedTerm": 24
}
```

**Beklenen Sonuç:**

```text
HTTP 404 Not Found
```

---

## TS-008 – Aktif Başvuru Çakışması

Aynı müşteri ve ürün için aktif bir başvuru mevcutken yeni başvuru gönderilir.

**Beklenen Sonuç:**

```text
HTTP 409 Conflict
```

Sistem duplicate aktif başvurunun oluşturulmasına izin vermemelidir.

---

# 6. Business Rule Test Senaryoları

## TS-009 – Yaş Kontrolü

**Business Rule:**

```text
BR-003: Müşteri yaşı en az 18 olmalıdır.
```

**Test Verisi:**

```text
Müşteri Yaşı: 17
```

**Beklenen Sonuç:**

Başvuru reddedilir.

---

## TS-010 – Kredi Skoru Kontrolü

**Business Rule:**

```text
BR-005: Kredi skoru >= 1200 olmalıdır.
```

**Test Verisi:**

```text
Kredi Skoru: 1100
```

**Beklenen Sonuç:**

Başvuru reddedilir.

---

## TS-011 – Taksit / Gelir Oranı

**Business Rule:**

```text
BR-006: Aylık taksit / aylık gelir <= %50 olmalıdır.
```

**Test Verisi:**

```text
Aylık Gelir: 40.000 TL
Aylık Taksit: 25.000 TL
Oran: %62,5
```

**Beklenen Sonuç:**

Başvuru reddedilir.

---

## TS-012 – Maksimum Kredi Tutarı

**Business Rule:**

```text
BR-007: Talep edilen kredi tutarı ürünün maksimum limitini aşmamalıdır.
```

**Test Verisi:**

```text
Ürün Maksimum Limiti: 100.000 TL
Talep Edilen Tutar: 150.000 TL
```

**Beklenen Sonuç:**

Başvuru reddedilir.

---

## TS-013 – Başarılı Kredi Tahsis Kararı

**Test Verisi:**

```text
Yaş: 30
Kredi Skoru: 1450
Aylık Gelir: 50.000 TL
Aylık Taksit: 20.000 TL
Talep Edilen Tutar: 75.000 TL
Ürün Maksimum Limiti: 100.000 TL
```

**Beklenen Sonuç:**

Tüm kriterler sağlandığında başvuru `APPROVED` durumuna geçer.

---

# 7. Database Test Senaryoları

## TS-014 – Başvuru Kaydının Oluşturulması

Başarılı bir kredi başvurusundan sonra `loan_applications` tablosu kontrol edilir.

**Beklenen Sonuç:**

Yeni başvuru kaydı database içerisinde bulunmalıdır.

---

## TS-015 – Başlangıç Status Kontrolü

Yeni oluşturulan başvurunun status alanı kontrol edilir.

**Beklenen Sonuç:**

```text
SUBMITTED
```

olmalıdır.

---

## TS-016 – Kredi Kararı Kaydı

Kredi tahsis kararı oluşturulduktan sonra `loan_decisions` tablosu kontrol edilir.

**Beklenen Sonuç:**

Başvuruya ait karar kaydı bulunmalıdır.

Karar;

```text
APPROVED
```

veya

```text
REJECTED
```

olabilir.

---

# 8. Integration Test Senaryoları

## TS-019 – Application ID Akışı

1. Frontend üzerinden başvuru gönderilir.
2. Backend request'i işler.
3. Database'e başvuru kaydedilir.
4. Database tarafından oluşturulan application ID backend'e döner.
5. Backend response'u frontend'e iletir.

**Beklenen Sonuç:**

Frontend üzerinde gösterilen `applicationId`, database'deki başvuru kaydıyla eşleşmelidir.

---

## TS-020 – Approved Başvuru ve Teklif

1. Başvuru oluşturulur.
2. Uygunluk kontrolleri yapılır.
3. Kredi tahsis kararı `APPROVED` olur.
4. Sistem kredi teklifini oluşturur.

**Beklenen Sonuç:**

Onaylanan başvuru için loan offer oluşturulmalıdır.

---

# 9. Negative Testing

Sistemin yalnızca başarılı senaryolarda değil, hatalı kullanıcı ve sistem davranışlarında da doğru çalışması kontrol edilmelidir.

Test edilmesi gereken örnekler:

* Boş zorunlu alan
* Negatif kredi tutarı
* 0 kredi tutarı
* Geçersiz vade
* Olmayan müşteri
* Olmayan kredi ürünü
* Aktif duplicate başvuru
* Düşük kredi skoru
* 18 yaş altı müşteri
* Ürün limitini aşan kredi talebi
* Geçersiz API request
* Olmayan application ID
* Yetkisiz API erişimi
* Beklenmeyen sistem hatası

---

# 10. Test Kapsamı Özeti

Bu test senaryoları ile sistemin;

* Kullanıcı arayüzü
* API servisleri
* Business rule'ları
* Database kayıtları
* Frontend-backend veri akışı
* Hata yönetimi
* Kredi tahsis kararı

üzerindeki temel davranışlarının doğrulanması hedeflenmektedir.

Testler ilerleyen aşamada **Test Case**, **Bug Report** ve **UAT** dokümanları ile detaylandırılacaktır.
