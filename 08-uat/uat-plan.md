# UAT Plan – Loan Allocation System

## 1. Amaç

Bu dokümanın amacı, dijital kredi başvuru ve kredi tahsis sisteminin iş gereksinimlerini karşılayıp karşılamadığını doğrulamak ve sistemin iş birimi tarafından kabul edilebilir durumda olup olmadığını değerlendirmektir.

UAT (User Acceptance Testing), sistemin yalnızca teknik olarak çalışıp çalışmadığını değil, tanımlanan iş ihtiyaçlarını karşılayıp karşılamadığını doğrulamak için gerçekleştirilir.

> Bu UAT planı tamamen kurgusal bir sistem için hazırlanmıştır.

---

# 2. UAT Kapsamı

UAT kapsamında aşağıdaki iş süreçleri doğrulanacaktır:

* Kredi başvurusu oluşturma
* Zorunlu alan kontrolleri
* Başvuru bilgilerinin doğrulanması
* Uygunluk kontrolü
* Kredi tahsis kriterlerinin uygulanması
* Kredi başvurusunun onaylanması
* Kredi başvurusunun reddedilmesi
* Başvuru status bilgisinin güncellenmesi
* Kredi teklifinin oluşturulması
* Başvuru durumunun görüntülenmesi

---

# 3. UAT Kapsamı Dışında

Aşağıdaki süreçler bu UAT çalışmasının kapsamında değildir:

* Gerçek banka entegrasyonları
* Gerçek kredi bürosu entegrasyonu
* Gerçek ödeme işlemleri
* Gerçek müşteri verileri
* Gerçek finansal işlem
* Üçüncü parti servislerin production ortamı testleri

---

# 4. UAT Rolleri

| Rol                  | Sorumluluk                                                                |
| -------------------- | ------------------------------------------------------------------------- |
| Business Stakeholder | İş gereksinimlerinin karşılanıp karşılanmadığını değerlendirir.           |
| Business Analyst     | UAT senaryolarını hazırlar, süreci koordine eder ve sonuçları takip eder. |
| Product Owner        | İş önceliklerini ve kabul kriterlerini doğrular.                          |
| QA                   | Test ortamı ve teknik test desteğini sağlar.                              |
| Development Team     | UAT sırasında tespit edilen teknik sorunları analiz eder ve düzeltir.     |
| Operations           | İş sürecinin operasyonel olarak uygulanabilirliğini değerlendirir.        |

---

# 5. UAT Ön Koşulları

UAT başlamadan önce aşağıdaki koşulların sağlanması beklenmektedir:

* Functional testler tamamlanmış olmalıdır.
* Critical ve High seviyeli açık bug bulunmamalıdır.
* Test ortamı kullanılabilir durumda olmalıdır.
* UAT test verileri hazırlanmış olmalıdır.
* Gereksinimler ve acceptance criteria dokümante edilmiş olmalıdır.
* Gerekli kullanıcı rollerinin erişimleri tanımlanmış olmalıdır.
* UAT senaryoları ilgili iş paydaşları tarafından gözden geçirilmiş olmalıdır.

---

# 6. UAT Senaryoları

## UAT-001 – Geçerli Kredi Başvurusu

**Related Requirement:** FR-001, FR-002, FR-005

### İş Amacı

Müşterinin geçerli bilgiler ile kredi başvurusu oluşturabilmesini doğrulamak.

### Ön Koşul

* Müşteri sistemde kayıtlıdır.
* Kredi ürünü aktiftir.

### Test Verisi

```text
Customer ID: 1001
Product ID: 101
Requested Amount: 75.000 TL
Requested Term: 24 ay
```

### Adımlar

1. Kredi başvuru ekranı açılır.
2. Müşteri bilgileri girilir.
3. Kredi ürünü seçilir.
4. Kredi tutarı girilir.
5. Vade bilgisi girilir.
6. Başvuru gönderilir.

### Beklenen Sonuç

* Başvuru başarıyla oluşturulmalıdır.
* Application ID oluşturulmalıdır.
* Başvuru status değeri `SUBMITTED` olmalıdır.

### UAT Sonucu

`Not Executed`

---

# 7. UAT-002 – Eksik Bilgi ile Başvuru

**Related Requirement:** FR-003

### İş Amacı

Kullanıcının zorunlu alanları doldurmadan başvuru oluşturamamasını doğrulamak.

### Adımlar

1. Başvuru ekranı açılır.
2. Zorunlu alanlardan biri boş bırakılır.
3. Başvuru gönderilir.

### Beklenen Sonuç

Sistem kullanıcıya ilgili alanın zorunlu olduğunu belirtmelidir.

Başvuru oluşturulmamalıdır.

### UAT Sonucu

`Not Executed`

---

# 8. UAT-003 – Uygun Olmayan Başvuru

**Related Requirement:** FR-007, FR-009

### İş Amacı

İş kriterlerini karşılamayan kredi başvurularının reddedildiğini doğrulamak.

### Test Verisi

```text
Age: 30
Credit Score: 1100
Monthly Income: 50.000 TL
Requested Amount: 75.000 TL
```

### Adımlar

1. Kredi başvurusu oluşturulur.
2. Uygunluk kontrolü gerçekleştirilir.
3. Tahsis kararı kontrol edilir.

### Beklenen Sonuç

Kredi skoru minimum kriteri karşılamadığı için başvuru reddedilmelidir.

```text
Decision: REJECTED
```

Karar nedeni kullanıcı veya ilgili iş birimi tarafından görüntülenebilmelidir.

### UAT Sonucu

`Not Executed`

---

# 9. UAT-004 – Uygun Başvurunun Onaylanması

**Related Requirement:** FR-007, FR-008, FR-009, FR-010

### İş Amacı

Tüm iş kriterlerini karşılayan başvurunun onaylanmasını doğrulamak.

### Test Verisi

```text
Age: 30
Credit Score: 1450
Monthly Income: 50.000 TL
Monthly Installment: 20.000 TL
Requested Amount: 75.000 TL
Product Maximum Amount: 100.000 TL
```

### Adımlar

1. Kredi başvurusu oluşturulur.
2. Uygunluk kontrolleri gerçekleştirilir.
3. Kredi tahsis değerlendirmesi yapılır.
4. Karar kontrol edilir.
5. Başvuru status değeri kontrol edilir.

### Beklenen Sonuç

Başvuru:

```text
APPROVED
```

olmalıdır.

Onaylanan başvuru için kredi teklifi oluşturulmalıdır.

### UAT Sonucu

`Not Executed`

---

# 10. UAT-005 – Başvuru Durumunun Görüntülenmesi

**Related Requirement:** FR-012

### İş Amacı

Kullanıcının kredi başvurusunun güncel durumunu görüntüleyebilmesini doğrulamak.

### Adımlar

1. Geçerli bir application ID alınır.
2. Başvuru durum ekranı açılır.
3. Başvuru durumu görüntülenir.

### Beklenen Sonuç

Sistemdeki güncel status kullanıcıya gösterilmelidir.

Örneğin:

```text
Application ID: 50001
Status: APPROVED
```

### UAT Sonucu

`Not Executed`

---

# 11. UAT-006 – Kredi Teklifinin Oluşturulması

**Related Requirement:** FR-010

### İş Amacı

Onaylanan kredi başvurusu için kredi teklifinin oluşturulduğunu doğrulamak.

### Ön Koşul

Başvurunun status değeri `APPROVED` olmalıdır.

### Adımlar

1. Onaylanan başvuru açılır.
2. Kredi teklifinin oluşturulup oluşturulmadığı kontrol edilir.
3. Teklif bilgileri incelenir.

### Beklenen Sonuç

Onaylanan başvuru için kredi teklifi oluşturulmalıdır.

### UAT Sonucu

`Not Executed`

---

# 12. UAT Sonuçları

UAT tamamlandıktan sonra sonuçlar aşağıdaki tablo üzerinden takip edilebilir.

| UAT ID  | Senaryo               | Sonuç | Durum        | Açık Bug |
| ------- | --------------------- | ----- | ------------ | -------- |
| UAT-001 | Geçerli başvuru       | -     | Not Executed | -        |
| UAT-002 | Eksik bilgi           | -     | Not Executed | -        |
| UAT-003 | Uygun olmayan başvuru | -     | Not Executed | -        |
| UAT-004 | Uygun başvuru         | -     | Not Executed | -        |
| UAT-005 | Status görüntüleme    | -     | Not Executed | -        |
| UAT-006 | Kredi teklifi         | -     | Not Executed | -        |

---

# 13. UAT Kabul Kriterleri

UAT'in başarılı kabul edilebilmesi için:

* Kritik işlevler başarılı şekilde çalışmalıdır.
* Critical seviyeli açık bug bulunmamalıdır.
* High seviyeli açık bug bulunmamalıdır.
* Temel business rule'lar doğru uygulanmalıdır.
* Gereksinimlerde belirtilen temel kullanıcı akışları çalışmalıdır.
* Başvuru ve karar status'ları doğru şekilde güncellenmelidir.
* Onaylanan başvurular için kredi teklifi oluşturulabilmelidir.
* İş birimi temel süreci kabul edilebilir bulmalıdır.

---

# 14. UAT Sign-off

UAT tamamlandıktan sonra ilgili iş paydaşlarının sonuçları değerlendirmesi beklenir.

Örnek sign-off:

```text
UAT Status: Accepted

Business Stakeholder: __________________

Business Analyst: ______________________

Product Owner: _________________________

Date: __________________________________
```

Eğer kritik bir problem bulunuyorsa UAT kabul edilmeyebilir ve ilgili problem giderildikten sonra yeniden test yapılabilir.

---

# 15. BA'nın UAT Sürecindeki Rolü

İş Analisti UAT sürecinde iş gereksinimleri ile kullanıcı kabulü arasındaki bağlantıyı kurar.

BA'nın temel sorumlulukları:

* UAT kapsamını belirlemek
* İş gereksinimlerini UAT senaryolarına dönüştürmek
* Acceptance Criteria'ları kontrol etmek
* İş paydaşlarından gelen geri bildirimleri toplamak
* Test sonuçlarını takip etmek
* Tespit edilen problemlerin ilgili requirement ile bağlantısını kurmak
* Geliştirme ve QA ekipleriyle koordinasyon sağlamak
* Gerekli durumlarda requirement veya acceptance criteria'ları netleştirmek
* UAT sonuçlarının dokümante edilmesini sağlamak
* İş biriminin kabul sürecini takip etmek

---

# 16. Requirement → UAT İlişkisi

UAT senaryolarının requirements ile ilişkisi:

```text
FR-001
  ↓
US-001
  ↓
AC
  ↓
UAT-001
```

```text
FR-007
  ↓
US-005
  ↓
BR-005 / BR-006 / BR-007
  ↓
UAT-003
UAT-004
```

Bu yapı sayesinde gereksinimlerin yalnızca dokümante edilmesi değil, kullanıcı kabul aşamasına kadar takip edilmesi sağlanır.

---

# 17. UAT Checklist

* [ ] UAT kapsamı belirlendi.
* [ ] UAT rollerinin sorumlulukları tanımlandı.
* [ ] UAT ön koşulları belirlendi.
* [ ] UAT senaryoları oluşturuldu.
* [ ] Business rule'lar UAT senaryolarına dahil edildi.
* [ ] Acceptance criteria ile bağlantı kuruldu.
* [ ] UAT sonuç tablosu oluşturuldu.
* [ ] Kabul kriterleri tanımlandı.
* [ ] Sign-off süreci tanımlandı.
* [ ] BA'nın UAT sürecindeki rolü açıklandı.
