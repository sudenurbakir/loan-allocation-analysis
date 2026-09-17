# Requirements Traceability Matrix (RTM)

## 1. Amaç

Requirements Traceability Matrix (RTM), proje kapsamında tanımlanan gereksinimlerin analiz, geliştirme ve test süreçleri boyunca izlenebilirliğini sağlamak amacıyla hazırlanmıştır.

RTM sayesinde her gereksinimin;

* Hangi User Story ile ilişkili olduğu,
* Hangi iş kuralını desteklediği,
* Hangi test senaryosu ve test case ile doğrulandığı,
* Hangi UAT senaryosu kapsamında değerlendirildiği

takip edilebilir.

---

## 2. Traceability Matrix

| Requirement ID | Requirement                                                    | User Story | Business Rule                  | Test Scenario                  | Test Case                      | UAT              |
| -------------- | -------------------------------------------------------------- | ---------- | ------------------------------ | ------------------------------ | ------------------------------ | ---------------- |
| FR-001         | Kredi başvurusu başlatılabilmeli                               | US-001     | -                              | TS-001                         | TC-001                         | UAT-001          |
| FR-002         | Müşteri bilgileri alınabilmeli                                 | US-001     | BR-001                         | TS-001                         | TC-001                         | UAT-001          |
| FR-003         | Zorunlu alanlar kontrol edilmeli                               | US-002     | BR-001                         | TS-002                         | TC-002                         | UAT-002          |
| FR-004         | Veri formatları doğrulanmalı                                   | US-003     | BR-002                         | TS-003                         | TC-003                         | UAT-001          |
| FR-005         | Başvuru oluşturulmalı ve benzersiz başvuru numarası üretilmeli | US-004     | BR-004                         | TS-005                         | TC-005                         | UAT-001          |
| FR-006         | Başvuru ilk oluşturulduğunda Submitted statüsünde olmalı       | US-004     | -                              | TS-015                         | TC-015                         | UAT-001          |
| FR-007         | Müşteri kredi uygunluğu kontrol edilmeli                       | US-005     | BR-003, BR-005, BR-006, BR-007 | TS-009, TS-010, TS-011, TS-012 | TC-009, TC-010, TC-011, TC-012 | UAT-003, UAT-004 |
| FR-008         | Kredi tahsis kuralları değerlendirilmelidir                    | US-006     | BR-005, BR-006, BR-007, BR-008 | TS-013                         | TC-013                         | UAT-004          |
| FR-009         | Kredi tahsis kararı oluşturulmalı                              | US-006     | BR-009                         | TS-013                         | TC-013                         | UAT-003, UAT-004 |
| FR-010         | Onaylanan başvuru için kredi teklifi oluşturulmalı             | US-007     | BR-010                         | TS-020                         | TC-020                         | UAT-004, UAT-006 |
| FR-011         | Başvuru statüsü güncellenmeli                                  | US-006     | BR-008, BR-009                 | TS-013                         | TC-013                         | UAT-003, UAT-004 |
| FR-012         | Müşteri başvuru durumunu görüntüleyebilmeli                    | US-008     | -                              | TS-017                         | TC-017                         | UAT-005          |
| FR-013         | Müşteriye başvuru sonucu bildirilmeli                          | US-009     | BR-009                         | TS-013                         | TC-013                         | UAT-003, UAT-004 |
| FR-014         | Başvuru geçmişi görüntülenebilmeli                             | US-010     | -                              | TS-019                         | TC-019                         | UAT-005          |
| FR-015         | Başvuru kayıtları veritabanında saklanmalı                     | -          | -                              | TS-014                         | TC-014                         | -                |

---

## 3. Test ve UAT Kapsamı

RTM üzerinden gereksinimlerin test kapsamı aşağıdaki şekilde takip edilebilir:

### Functional Requirements

* FR-001 → Başvuru başlatma
* FR-002 → Müşteri bilgilerinin alınması
* FR-003 → Zorunlu alan kontrolü
* FR-004 → Veri formatı kontrolü
* FR-005 → Başvuru oluşturma
* FR-006 → Başlangıç statüsü
* FR-007 → Uygunluk kontrolü
* FR-008 → Tahsis kurallarının değerlendirilmesi
* FR-009 → Tahsis kararı
* FR-010 → Kredi teklifi
* FR-011 → Statü güncelleme
* FR-012 → Başvuru durumunun görüntülenmesi
* FR-013 → Bildirim
* FR-014 → Başvuru geçmişi
* FR-015 → Veritabanı kaydı

---

## 4. Requirement → Test → UAT Akışı

Bir gereksinimin proje içerisindeki izlenebilirliği aşağıdaki şekilde özetlenebilir:

```text
Requirement
     ↓
User Story
     ↓
Business Rule
     ↓
Test Scenario
     ↓
Test Case
     ↓
UAT
     ↓
Business Acceptance
```

Bu yapı sayesinde bir gereksinimin yalnızca dokümante edilmesi değil, geliştirme ve doğrulama süreçlerinde de takip edilmesi sağlanır.

---

## 5. Örnek Traceability

### FR-007 – Kredi Uygunluk Kontrolü

**Requirement:**
Müşterinin kredi başvurusu için uygunluğu kontrol edilmelidir.

**User Story:**
US-005 – Müşteri olarak kredi başvurumun uygunluk kontrolünün yapılmasını istiyorum.

**Business Rules:**

* BR-003 → Müşteri 18 yaşından büyük veya eşit olmalıdır.
* BR-005 → Kredi skoru minimum 1200 olmalıdır.
* BR-006 → Aylık taksit / gelir oranı %50'yi geçmemelidir.
* BR-007 → Talep edilen kredi tutarı ürün maksimum tutarını geçmemelidir.

**Test Scenarios:**

* TS-009 → Yaş kontrolü
* TS-010 → Kredi skoru kontrolü
* TS-011 → Gelir / taksit oranı kontrolü
* TS-012 → Maksimum kredi tutarı kontrolü

**Test Cases:**

* TC-009
* TC-010
* TC-011
* TC-012

**UAT:**

* UAT-003 → Uygun olmayan başvuru
* UAT-004 → Uygun başvurunun onaylanması

---

## 6. RTM Kullanım Amacı

Bu matris proje boyunca aşağıdaki amaçlarla kullanılabilir:

* Gereksinimlerin test kapsamına alınıp alınmadığını kontrol etmek
* Eksik test senaryolarını tespit etmek
* Gereksinim ve testler arasındaki bağlantıyı korumak
* UAT kapsamını belirlemek
* Değişikliklerin etkisini analiz etmek
* İş birimi ve teknik ekipler arasındaki ortak anlayışı desteklemek
* Proje sonunda gereksinimlerin karşılandığını doğrulamak

---

## 7. BA Perspektifi

İş analisti açısından RTM, gereksinimlerin yaşam döngüsü boyunca izlenebilirliğini sağlayan önemli bir dokümantasyon aracıdır.

Özellikle bir gereksinimde değişiklik olduğunda, ilgili User Story, Business Rule, Test Case ve UAT senaryolarının belirlenmesine yardımcı olur.

Örneğin **FR-007 kredi uygunluk kontrolü** değişirse, buna bağlı iş kuralları ve testlerin tekrar değerlendirilmesi gerekir.

Bu nedenle RTM yalnızca proje sonunda oluşturulan bir tablo değil, proje boyunca güncel tutulabilecek bir takip aracıdır.
