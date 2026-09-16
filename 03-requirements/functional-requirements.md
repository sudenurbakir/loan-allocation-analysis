# Functional Requirements

## 1. Genel Bakış

Functional Requirements, kredi başvuru ve tahsis sürecinde sistemin gerçekleştirmesi gereken fonksiyonları tanımlamaktadır.

Her gereksinim benzersiz bir ID ile tanımlanmış ve test edilebilir olacak şekilde hazırlanmıştır.

## 2. Gereksinimler

### FR-001 — Kredi Başvurusu Başlatma

Sistem, uygun müşterilerin kredi başvuru sürecini başlatmasına izin vermelidir.

**Priority:** High

---

### FR-002 — Müşteri Bilgilerinin Alınması

Sistem, kredi başvurusu sırasında müşteriden gerekli kişisel ve finansal bilgileri almalıdır.

**Priority:** High

---

### FR-003 — Zorunlu Alan Kontrolü

Sistem, kredi başvurusu gönderilmeden önce zorunlu alanların doldurulup doldurulmadığını kontrol etmelidir.

Zorunlu alanlardan herhangi biri boş bırakıldığında sistem başvurunun gönderilmesine izin vermemeli ve ilgili alanda kullanıcıya bilgilendirme göstermelidir.

**Priority:** High

---

### FR-004 — Veri Formatı Kontrolü

Sistem, kullanıcı tarafından girilen bilgilerin tanımlanan veri formatlarına uygun olup olmadığını kontrol etmelidir.

Örneğin;

* Gelir alanı sayısal değer kabul etmelidir.
* Telefon numarası tanımlanan formatta olmalıdır.
* Kimlik numarası belirlenen uzunluk ve format kurallarına uygun olmalıdır.

**Priority:** High

---

### FR-005 — Kredi Başvurusu Oluşturma

Sistem, tüm zorunlu bilgiler geçerli olduğunda kredi başvurusu oluşturmalı ve başvuruya benzersiz bir başvuru numarası vermelidir.

**Priority:** High

---

### FR-006 — Başvuru Durumu Oluşturma

Sistem, oluşturulan kredi başvurusuna başlangıç durumu atamalıdır.

Başlangıç durumu:

`Submitted`

olmalıdır.

**Priority:** High

---

### FR-007 — Uygunluk Kontrolü

Sistem, oluşturulan kredi başvurusu için tanımlanan uygunluk kriterlerini kontrol etmelidir.

**Priority:** High

---

### FR-008 — Kredi Tahsis Kurallarının Değerlendirilmesi

Sistem, uygunluk kontrolünden geçen başvuruları tanımlanan kredi tahsis kurallarına göre değerlendirmelidir.

**Priority:** High

---

### FR-009 — Kredi Tahsis Kararı

Sistem, değerlendirme sonucuna göre kredi başvurusu için bir tahsis kararı oluşturmalıdır.

Tahsis kararı aşağıdaki değerlerden biri olmalıdır:

* Approved
* Rejected

**Priority:** High

---

### FR-010 — Kredi Teklifi Oluşturma

Sistem, kredi başvurusu onaylandığında müşteriye ait kredi teklifini oluşturmalıdır.

**Priority:** High

---

### FR-011 — Başvuru Durumu Güncelleme

Sistem, kredi başvurusunun süreç içerisindeki durumunu ilgili işlem sonucuna göre güncellemelidir.

Örnek durumlar:

* Submitted
* Under Review
* Approved
* Rejected

**Priority:** High

---

### FR-012 — Başvuru Durumu Görüntüleme

Sistem, müşterinin kendi kredi başvurusunun mevcut durumunu görüntülemesine izin vermelidir.

**Priority:** Medium

---

### FR-013 — Müşteri Bilgilendirme

Sistem, kredi başvurusunun sonucu oluştuğunda müşteriye başvuru sonucu hakkında bilgilendirme göndermelidir.

**Priority:** Medium

---

### FR-014 — Başvuru Geçmişi

Sistem, müşterinin geçmiş kredi başvurularını görüntüleyebilmesini sağlamalıdır.

**Priority:** Medium

---

### FR-015 — Başvuru Kayıtlarının Saklanması

Sistem, oluşturulan kredi başvurularına ilişkin bilgileri daha sonra görüntülenebilecek ve raporlanabilecek şekilde saklamalıdır.

**Priority:** High

## 3. Requirement Quality

Gereksinimler;

* Açık
* Tek anlamlı
* Test edilebilir
* İzlenebilir
* İş ihtiyacı ile ilişkili

olacak şekilde hazırlanmıştır.
