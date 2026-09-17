# Test Cases – Loan Allocation System

## 1. Amaç

Bu doküman, kredi başvuru ve kredi tahsis sürecinde tanımlanan test senaryolarının detaylı test case'lere dönüştürülmesi amacıyla hazırlanmıştır.

Her test case içerisinde;

* Test Case ID
* Scenario ID
* Test amacı
* Ön koşullar
* Test verisi
* Test adımları
* Beklenen sonuç
* Actual Result
* Test Status

alanları bulunmaktadır.

> Test verileri ve senaryolar tamamen kurgusaldır.

---

# 2. Test Case'ler

## TC-001 – Geçerli Kredi Başvurusu

**Scenario ID:** TS-001
**Test Type:** Functional / Frontend
**Priority:** High

### Amaç

Kullanıcının geçerli bilgiler ile kredi başvurusu oluşturabildiğini doğrulamak.

### Ön Koşullar

* Kullanıcı sistemde kayıtlı olmalıdır.
* Kredi ürünü aktif olmalıdır.
* Kullanıcı kredi başvuru ekranına erişebilmelidir.

### Test Verisi

```text
Customer ID: 1001
Product ID: 101
Requested Amount: 75.000 TL
Requested Term: 24 ay
```

### Test Adımları

1. Kredi başvuru ekranı açılır.
2. Customer ID alanına `1001` girilir.
3. Kredi ürünü olarak `101` seçilir.
4. Kredi tutarı `75.000 TL` olarak girilir.
5. Vade `24` ay olarak girilir.
6. Başvuru gönderilir.

### Beklenen Sonuç

* Form başarıyla gönderilmelidir.
* Backend'e geçerli request gönderilmelidir.
* Başvuru oluşturulmalıdır.
* Kullanıcıya başarılı işlem mesajı gösterilmelidir.
* Başvuru status değeri `SUBMITTED` olmalıdır.
* Application ID oluşturulmalıdır.

### Actual Result

Test sırasında doldurulacaktır.

### Status

`Not Executed`

---

# TC-002 – Zorunlu Alan Kontrolü

**Scenario ID:** TS-002
**Test Type:** Frontend
**Priority:** High

### Amaç

Zorunlu alanların boş bırakılması durumunda başvurunun gönderilemediğini doğrulamak.

### Ön Koşullar

Kredi başvuru ekranı açık olmalıdır.

### Test Adımları

1. Kredi başvuru ekranı açılır.
2. Zorunlu alanlardan biri boş bırakılır.
3. Başvuru gönder butonuna tıklanır.

### Beklenen Sonuç

* Sistem boş bırakılan alanı belirtmelidir.
* Kullanıcıya uygun validation mesajı gösterilmelidir.
* API request gönderilmemelidir.
* Başvuru oluşturulmamalıdır.

### Actual Result

Test sırasında doldurulacaktır.

### Status

`Not Executed`

---

# TC-003 – Geçersiz Kredi Tutarı

**Scenario ID:** TS-003
**Test Type:** Frontend / Business Rule
**Priority:** High

### Test Verisi

```text
Requested Amount: -5.000 TL
```

### Test Adımları

1. Kredi başvuru ekranı açılır.
2. Geçersiz kredi tutarı girilir.
3. Başvuru gönderilmeye çalışılır.

### Beklenen Sonuç

Sistem negatif kredi tutarını kabul etmemelidir.

Kullanıcıya:

```text
Kredi tutarı 0'dan büyük olmalıdır.
```

benzeri bir hata mesajı gösterilmelidir.

### Actual Result

Test sırasında doldurulacaktır.

### Status

`Not Executed`

---

# TC-004 – Geçersiz Vade

**Scenario ID:** TS-004
**Test Type:** Frontend / Business Rule
**Priority:** High

### Test Verisi

```text
Requested Term: 0
```

### Test Adımları

1. Başvuru ekranı açılır.
2. Vade alanına `0` girilir.
3. Başvuru gönderilmeye çalışılır.

### Beklenen Sonuç

Sistem 0 veya negatif vade değerini kabul etmemelidir.

### Actual Result

Test sırasında doldurulacaktır.

### Status

`Not Executed`

---

# TC-005 – Başarılı API Request

**Scenario ID:** TS-005
**Test Type:** Backend / API
**Priority:** High

### Endpoint

```http
POST /api/loan-applications
```

### Request

```json
{
  "customerId": 1001,
  "productId": 101,
  "requestedAmount": 75000,
  "requestedTerm": 24
}
```

### Test Adımları

1. API endpoint'e geçerli request gönderilir.
2. HTTP response kontrol edilir.
3. Response body kontrol edilir.
4. Database kaydı kontrol edilir.

### Beklenen Sonuç

HTTP status:

```text
201 Created
```

Response içerisinde:

* `applicationId`
* `status`
* `message`

alanları bulunmalıdır.

Status:

```text
SUBMITTED
```

olmalıdır.

### Actual Result

Test sırasında doldurulacaktır.

### Status

`Not Executed`

---

# TC-006 – Eksik Alan İçeren API Request

**Scenario ID:** TS-006
**Test Type:** Backend / API
**Priority:** High

### Request

```json
{
  "customerId": 1001,
  "productId": 101
}
```

`requestedAmount` ve `requestedTerm` alanları gönderilmemiştir.

### Test Adımları

1. API endpoint'e request gönderilir.
2. HTTP response kontrol edilir.
3. Response body kontrol edilir.
4. Database'de yeni kayıt oluşup oluşmadığı kontrol edilir.

### Beklenen Sonuç

HTTP status:

```text
400 Bad Request
```

olmalıdır.

API eksik alanları belirtmelidir.

Database'e geçersiz başvuru kaydedilmemelidir.

### Actual Result

Test sırasında doldurulacaktır.

### Status

`Not Executed`

---

# TC-007 – Olmayan Müşteri

**Scenario ID:** TS-007
**Test Type:** Backend / API
**Priority:** High

### Test Verisi

```text
Customer ID: 999999
```

### Test Adımları

1. Olmayan müşteri ID'si ile API request gönderilir.
2. Response kontrol edilir.

### Beklenen Sonuç

HTTP status:

```text
404 Not Found
```

olmalıdır.

Response:

```json
{
  "errorCode": "CUSTOMER_NOT_FOUND",
  "message": "Customer was not found."
}
```

benzeri bir hata dönmelidir.

### Status

`Not Executed`

---

# TC-008 – Duplicate Aktif Başvuru

**Scenario ID:** TS-008
**Test Type:** Backend / Business Rule
**Priority:** High

### Ön Koşul

Müşterinin aynı ürün için aktif bir başvurusu bulunmalıdır.

### Test Adımları

1. Aynı müşteri ve ürün bilgileriyle yeni başvuru gönderilir.
2. API response kontrol edilir.
3. Database kontrol edilir.

### Beklenen Sonuç

HTTP status:

```text
409 Conflict
```

olmalıdır.

Yeni duplicate başvuru oluşturulmamalıdır.

### Status

`Not Executed`

---

# TC-009 – Yaş Kriterinin Sağlanmaması

**Scenario ID:** TS-009
**Test Type:** Business Rule
**Priority:** High

### Business Rule

```text
BR-003: Müşteri yaşı en az 18 olmalıdır.
```

### Test Verisi

```text
Customer Age: 17
```

### Test Adımları

1. 17 yaşındaki müşteri için kredi başvurusu oluşturulur.
2. Uygunluk kontrolü başlatılır.
3. Karar sonucu kontrol edilir.

### Beklenen Sonuç

Başvuru reddedilmelidir.

Decision:

```text
REJECTED
```

olmalıdır.

### Status

`Not Executed`

---

# TC-010 – Kredi Skoru Yetersiz

**Scenario ID:** TS-010
**Test Type:** Business Rule
**Priority:** High

### Business Rule

```text
BR-005: Kredi skoru >= 1200 olmalıdır.
```

### Test Verisi

```text
Credit Score: 1100
```

### Test Adımları

1. Başvuru oluşturulur.
2. Kredi skoru değerlendirilir.
3. Tahsis kararı kontrol edilir.

### Beklenen Sonuç

Başvuru:

```text
REJECTED
```

olmalıdır.

Decision reason içerisinde kredi skorunun kriteri karşılamadığı belirtilmelidir.

### Status

`Not Executed`

---

# TC-011 – Taksit / Gelir Oranının Aşılması

**Scenario ID:** TS-011
**Test Type:** Business Rule
**Priority:** High

### Business Rule

```text
BR-006: Aylık taksit / aylık gelir <= %50 olmalıdır.
```

### Test Verisi

```text
Monthly Income: 40.000 TL
Monthly Installment: 25.000 TL
Ratio: %62,5
```

### Test Adımları

1. Başvuru oluşturulur.
2. Aylık gelir bilgisi alınır.
3. Aylık taksit / gelir oranı hesaplanır.
4. Tahsis kararı kontrol edilir.

### Beklenen Sonuç

Oran %50'yi aştığı için başvuru reddedilmelidir.

### Status

`Not Executed`

---

# TC-012 – Ürün Limitinin Aşılması

**Scenario ID:** TS-012
**Test Type:** Business Rule
**Priority:** High

### Test Verisi

```text
Product Maximum Amount: 100.000 TL
Requested Amount: 150.000 TL
```

### Test Adımları

1. Kullanıcı 150.000 TL kredi talep eder.
2. Sistem ürün limitini kontrol eder.
3. Tahsis sonucu kontrol edilir.

### Beklenen Sonuç

Başvuru reddedilmelidir.

Decision:

```text
REJECTED
```

olmalıdır.

### Status

`Not Executed`

---

# TC-013 – Başarılı Kredi Tahsis Kararı

**Scenario ID:** TS-013
**Test Type:** Business Rule / Integration
**Priority:** Critical

### Test Verisi

```text
Age: 30
Credit Score: 1450
Monthly Income: 50.000 TL
Monthly Installment: 20.000 TL
Requested Amount: 75.000 TL
Product Maximum Amount: 100.000 TL
```

### Test Adımları

1. Kredi başvurusu oluşturulur.
2. Müşteri yaşı kontrol edilir.
3. Kredi skoru kontrol edilir.
4. Taksit / gelir oranı hesaplanır.
5. Kredi tutarı ürün limitiyle karşılaştırılır.
6. Tahsis kararı oluşturulur.

### Beklenen Sonuç

Tüm kriterler sağlandığında:

```text
Decision: APPROVED
```

olmalıdır.

Başvuru status değeri güncellenmelidir.

Kredi teklifi oluşturulmalıdır.

### Status

`Not Executed`

---

# TC-014 – Database Başvuru Kaydı

**Scenario ID:** TS-014
**Test Type:** Database
**Priority:** High

### Test Adımları

1. Geçerli bir kredi başvurusu oluşturulur.
2. Database'e erişilir.
3. `loan_applications` tablosu sorgulanır.
4. Oluşturulan application ID aranır.

### SQL Kontrolü

```sql
SELECT *
FROM loan_applications
WHERE application_id = 50001;
```

### Beklenen Sonuç

Başvuru kaydı database içerisinde bulunmalıdır.

Aşağıdaki alanlar doğru şekilde kaydedilmiş olmalıdır:

* customer_id
* product_id
* requested_amount
* requested_term
* status
* application_date

### Status

`Not Executed`

---

# TC-015 – Başlangıç Status Kontrolü

**Scenario ID:** TS-015
**Test Type:** Database
**Priority:** Medium

### Test Adımları

1. Yeni kredi başvurusu oluşturulur.
2. `loan_applications` tablosu sorgulanır.
3. Status alanı kontrol edilir.

### SQL Kontrolü

```sql
SELECT application_id, status
FROM loan_applications
WHERE application_id = 50001;
```

### Beklenen Sonuç

Yeni başvurunun status değeri:

```text
SUBMITTED
```

olmalıdır.

### Status

`Not Executed`

---

# TC-016 – Kredi Kararı Database Kaydı

**Scenario ID:** TS-016
**Test Type:** Database
**Priority:** High

### Test Adımları

1. Kredi başvurusu değerlendirilir.
2. Tahsis kararı oluşturulur.
3. `loan_decisions` tablosu sorgulanır.

### SQL Kontrolü

```sql
SELECT *
FROM loan_decisions
WHERE application_id = 50001;
```

### Beklenen Sonuç

Başvuruya ait karar kaydı oluşturulmuş olmalıdır.

Decision:

```text
APPROVED
```

veya

```text
REJECTED
```

olmalıdır.

### Status

`Not Executed`

---

# TC-017 – Application Status API

**Scenario ID:** TS-017
**Test Type:** API
**Priority:** High

### Endpoint

```http
GET /api/loan-applications/50001/status
```

### Test Adımları

1. Geçerli application ID ile GET request gönderilir.
2. HTTP response kontrol edilir.
3. Response body kontrol edilir.
4. Database'deki status ile karşılaştırılır.

### Beklenen Sonuç

HTTP status:

```text
200 OK
```

olmalıdır.

API'den dönen status database'deki güncel status ile aynı olmalıdır.

### Status

`Not Executed`

---

# TC-018 – Olmayan Application ID

**Scenario ID:** TS-018
**Test Type:** API / Negative
**Priority:** Medium

### Request

```http
GET /api/loan-applications/999999/status
```

### Beklenen Sonuç

HTTP status:

```text
404 Not Found
```

olmalıdır.

Kullanıcıya başvurunun bulunamadığını belirten uygun hata mesajı dönmelidir.

### Status

`Not Executed`

---

# TC-019 – Application ID Veri Akışı

**Scenario ID:** TS-019
**Test Type:** Integration
**Priority:** High

### Test Adımları

1. Frontend üzerinden kredi başvurusu gönderilir.
2. Backend request'i alır.
3. Database'e kayıt oluşturulur.
4. Database'deki application ID alınır.
5. Backend response oluşturur.
6. Response frontend'e gönderilir.

### Beklenen Sonuç

Frontend'de gösterilen application ID ile database'deki application ID aynı olmalıdır.

### Status

`Not Executed`

---

# TC-020 – Approved Başvuru İçin Teklif Oluşturulması

**Scenario ID:** TS-020
**Test Type:** Integration / Functional
**Priority:** Critical

### Ön Koşullar

* Başvuru oluşturulmuş olmalıdır.
* Tüm uygunluk kriterleri sağlanmalıdır.
* Kredi kararı `APPROVED` olmalıdır.

### Test Adımları

1. Başvuru değerlendirilir.
2. Kredi tahsis kararı oluşturulur.
3. Karar `APPROVED` olarak kaydedilir.
4. Sistem kredi teklifini oluşturur.
5. Teklif bilgileri kontrol edilir.

### Beklenen Sonuç

Onaylanan başvuru için kredi teklifi oluşturulmalıdır.

Başvurunun durumu:

```text
OFFER_CREATED
```

olmalıdır.

### Status

`Not Executed`

---

# 3. Test Sonuçları

Testlerin gerçek ortamda çalıştırılması sonrasında sonuçlar aşağıdaki şekilde güncellenecektir.

| Test Case | Actual Result | Status       | Bug ID |
| --------- | ------------- | ------------ | ------ |
| TC-001    | -             | Not Executed | -      |
| TC-002    | -             | Not Executed | -      |
| TC-003    | -             | Not Executed | -      |
| TC-004    | -             | Not Executed | -      |
| TC-005    | -             | Not Executed | -      |
| TC-006    | -             | Not Executed | -      |
| TC-007    | -             | Not Executed | -      |
| TC-008    | -             | Not Executed | -      |
| TC-009    | -             | Not Executed | -      |
| TC-010    | -             | Not Executed | -      |
| TC-011    | -             | Not Executed | -      |
| TC-012    | -             | Not Executed | -      |
| TC-013    | -             | Not Executed | -      |
| TC-014    | -             | Not Executed | -      |
| TC-015    | -             | Not Executed | -      |
| TC-016    | -             | Not Executed | -      |
| TC-017    | -             | Not Executed | -      |
| TC-018    | -             | Not Executed | -      |
| TC-019    | -             | Not Executed | -      |
| TC-020    | -             | Not Executed | -      |

---

# 4. Test Status Definitions

| Status       | Açıklama                                            |
| ------------ | --------------------------------------------------- |
| Not Executed | Test henüz çalıştırılmadı                           |
| Pass         | Beklenen sonuç elde edildi                          |
| Fail         | Beklenen sonuç elde edilmedi                        |
| Blocked      | Test başka bir bağımlılık nedeniyle çalıştırılamadı |
| Retest       | Hata düzeltildikten sonra tekrar test edilecek      |

---

# 5. BA Perspektifinden Test Case Yaklaşımı

İş Analisti açısından test case hazırlanırken gereksinimin test edilebilir olması önemlidir.

Her test case mümkün olduğunca belirli bir requirement veya business rule ile ilişkilendirilmelidir.

Örneğin:

```text
FR-007
   |
   v
US-005
   |
   v
BR-005
   |
   v
TS-010
   |
   v
TC-010
```

Bu yapı sayesinde bir gereksinimin;

**Requirement → User Story → Business Rule → Test Scenario → Test Case**

şeklinde takip edilmesi sağlanır.

Bu yaklaşım daha sonra `Requirements_Traceability_Matrix.md` dosyasında bütün proje genelinde gösterilecektir.
