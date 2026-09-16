# User Stories

## 1. Genel Bakış

Bu bölümde kredi başvuru ve tahsis süreci için tanımlanan fonksiyonel gereksinimler, Agile yaklaşım doğrultusunda User Story formatına dönüştürülmüştür.

User Story'ler, sistemin farklı kullanıcılar açısından sağlaması gereken işlevleri tanımlamakta ve Acceptance Criteria aracılığıyla test edilebilir hale getirilmektedir.

---

## US-001 — Kredi Başvurusu Başlatma

**Requirement:** FR-001

**User Story**

Bir müşteri olarak, kredi başvurusu başlatmak istiyorum, böylece ihtiyaç duyduğum kredi ürünü için başvuru sürecine başlayabilirim.

**Business Value**

Müşterinin kredi başvuru sürecine dijital kanaldan başlayabilmesini sağlar.

**Priority:** High

### Acceptance Criteria

**AC-001**

Given müşteri kredi başvuru ekranındadır,

When geçerli bir kredi ürünü seçer,

Then sistem kredi başvuru formunu göstermelidir.

**AC-002**

Given müşteri kredi başvuru formundadır,

When gerekli bilgileri doldurur,

Then sistem başvurunun bir sonraki aşamasına geçmesine izin vermelidir.

---

## US-002 — Zorunlu Alan Kontrolü

**Requirement:** FR-003

**User Story**

Bir müşteri olarak, başvuru sırasında eksik bilgi girdiğimde hangi alanları tamamlamam gerektiğini görmek istiyorum, böylece başvurumu doğru şekilde tamamlayabilirim.

**Business Value**

Eksik bilgi nedeniyle oluşabilecek hatalı veya tamamlanamayan başvuruların azaltılmasını sağlar.

**Priority:** High

### Acceptance Criteria

**AC-001**

Given müşteri kredi başvuru formundadır,

When zorunlu alanlardan biri boş bırakılır,

Then sistem ilgili alanın zorunlu olduğunu belirtmelidir.

**AC-002**

Given zorunlu alanlardan biri boş bırakılmıştır,

When müşteri başvuruyu göndermek ister,

Then sistem başvurunun gönderilmesine izin vermemelidir.

**AC-003**

Given tüm zorunlu alanlar doldurulmuştur,

When müşteri başvuruyu gönderir,

Then sistem başvurunun bir sonraki aşamasına geçmelidir.

---

## US-003 — Veri Formatı Kontrolü

**Requirement:** FR-004

**User Story**

Bir müşteri olarak, girdiğim bilgilerin doğru formatta olup olmadığını başvuru sırasında görmek istiyorum, böylece hatalı bilgi gönderimini önleyebilirim.

**Business Value**

Hatalı veri girişlerinin ve başvuru sonrasında oluşabilecek veri problemlerinin azaltılmasını sağlar.

**Priority:** High

### Acceptance Criteria

**AC-001**

Given müşteri gelir bilgisini girmektedir,

When geçersiz bir değer girerse,

Then sistem kullanıcıya uygun bir hata mesajı göstermelidir.

**AC-002**

Given müşteri telefon numarası girmektedir,

When telefon numarası tanımlanan formata uygun değilse,

Then sistem kullanıcıya format hatası göstermelidir.

**AC-003**

Given girilen tüm bilgiler tanımlanan formatlara uygundur,

When müşteri başvuruyu gönderir,

Then sistem başvurunun oluşturulmasına izin vermelidir.

---

## US-004 — Kredi Başvurusu Oluşturma

**Requirement:** FR-005

**User Story**

Bir müşteri olarak, gerekli bilgilerimi tamamladıktan sonra kredi başvurusu oluşturmak istiyorum, böylece başvurum değerlendirme sürecine alınabilir.

**Business Value**

Müşterinin kredi başvurusunu tamamlayarak değerlendirme sürecine dahil olmasını sağlar.

**Priority:** High

### Acceptance Criteria

**AC-001**

Given tüm zorunlu bilgiler geçerlidir,

When müşteri başvuruyu gönderir,

Then sistem yeni bir kredi başvurusu oluşturmalıdır.

**AC-002**

Given kredi başvurusu başarıyla oluşturulmuştur,

When sistem başvuru kaydını oluşturur,

Then başvuruya benzersiz bir başvuru numarası atanmalıdır.

**AC-003**

Given yeni bir kredi başvurusu oluşturulmuştur,

When başvuru kaydedilir,

Then başvurunun başlangıç durumu `Submitted` olmalıdır.

---

## US-005 — Kredi Uygunluk Kontrolü

**Requirement:** FR-007

**User Story**

Bir kredi değerlendirme sistemi olarak, başvuru sahibinin uygunluk kriterlerini kontrol etmek istiyorum, böylece uygun olmayan başvuruların sonraki aşamaya geçmesini engelleyebilirim.

**Business Value**

Kredi tahsis sürecinde belirlenen temel uygunluk kriterlerinin standart şekilde uygulanmasını sağlar.

**Priority:** High

### Acceptance Criteria

**AC-001**

Given kredi başvurusu oluşturulmuştur,

When uygunluk kriterleri değerlendirilir,

Then sistem müşterinin yaş kriterini kontrol etmelidir.

**AC-002**

Given müşteri yaş kriterini karşılamamaktadır,

When uygunluk kontrolü tamamlanır,

Then sistem başvuruyu uygun olmayan başvuru olarak işaretlemelidir.

**AC-003**

Given müşteri temel uygunluk kriterlerini karşılamaktadır,

When uygunluk kontrolü tamamlanır,

Then sistem başvuruyu kredi tahsis değerlendirmesine göndermelidir.

---

## US-006 — Kredi Tahsis Kararı

**Requirement:** FR-009

**User Story**

Bir kredi değerlendirme sistemi olarak, başvuru bilgilerini belirlenen kredi tahsis kurallarına göre değerlendirmek istiyorum, böylece başvuru için bir tahsis kararı oluşturabilirim.

**Business Value**

Kredi tahsis kararının tanımlanan iş kuralları doğrultusunda standartlaştırılmasını sağlar.

**Priority:** High

### Acceptance Criteria

**AC-001**

Given başvuru sahibi tüm uygunluk kriterlerini karşılamaktadır,

When kredi tahsis kuralları değerlendirilir,

Then sistem başvuruyu kredi tahsis değerlendirmesine almalıdır.

**AC-002**

Given müşterinin kredi skoru minimum değerin altındadır,

When kredi tahsis kuralları değerlendirilir,

Then sistem başvuruyu `Rejected` olarak işaretlemelidir.

**AC-003**

Given aylık kredi taksiti müşterinin gelirinin %50'sinden fazladır,

When kredi tahsis kuralları değerlendirilir,

Then sistem başvuruyu `Rejected` olarak işaretlemelidir.

**AC-004**

Given başvuru sahibi tüm kredi tahsis kriterlerini karşılamaktadır,

When değerlendirme tamamlanır,

Then sistem başvuruyu `Approved` olarak işaretlemelidir.

---

## US-007 — Kredi Teklifi Oluşturma

**Requirement:** FR-010

**User Story**

Bir müşteri olarak, kredi başvurum onaylandığında bana uygun kredi teklifini görmek istiyorum, böylece kredi koşullarını inceleyebilirim.

**Business Value**

Onaylanan kredi başvurularının müşteriye teklif olarak sunulmasını sağlar.

**Priority:** High

### Acceptance Criteria

**AC-001**

Given kredi başvurusu `Approved` durumundadır,

When kredi tahsis kararı tamamlanır,

Then sistem kredi teklifini oluşturmalıdır.

**AC-002**

Given kredi teklifi oluşturulmuştur,

When müşteri teklif ekranını açar,

Then sistem müşteriye ait kredi teklifini göstermelidir.

---

## US-008 — Başvuru Durumu Görüntüleme

**Requirement:** FR-012

**User Story**

Bir müşteri olarak, kredi başvurumun mevcut durumunu görüntülemek istiyorum, böylece başvurumun hangi aşamada olduğunu takip edebilirim.

**Business Value**

Müşterinin başvuru süreci hakkında bilgi sahibi olmasını ve gereksiz iletişim ihtiyacının azaltılmasını sağlar.

**Priority:** Medium

### Acceptance Criteria

**AC-001**

Given müşterinin oluşturulmuş bir kredi başvurusu vardır,

When müşteri başvuru durumunu görüntüler,

Then sistem mevcut başvuru durumunu göstermelidir.

**AC-002**

Given başvurunun durumu değişmiştir,

When müşteri başvuru detaylarını görüntüler,

Then sistem güncel durumu göstermelidir.

---

## US-009 — Müşteri Bilgilendirme

**Requirement:** FR-013

**User Story**

Bir müşteri olarak, kredi başvurumun sonucu hakkında bilgilendirilmek istiyorum, böylece başvuru sonucumu takip edebilirim.

**Business Value**

Başvuru sonucunun müşteriye zamanında iletilmesini sağlar.

**Priority:** Medium

### Acceptance Criteria

**AC-001**

Given kredi başvurusu değerlendirilmiştir,

When başvuru sonucu `Approved` veya `Rejected` olarak belirlenir,

Then sistem müşteriye başvuru sonucuyla ilgili bildirim oluşturmalıdır.

**AC-002**

Given kredi başvurusu onaylanmıştır,

When bildirim oluşturulur,

Then bildirimde başvurunun onaylandığı belirtilmelidir.

**AC-003**

Given kredi başvurusu reddedilmiştir,

When bildirim oluşturulur,

Then bildirimde başvurunun reddedildiği belirtilmelidir.

---

## US-010 — Başvuru Geçmişi

**Requirement:** FR-014

**User Story**

Bir müşteri olarak, geçmiş kredi başvurularımı görüntülemek istiyorum, böylece daha önce gerçekleştirdiğim başvuruları takip edebilirim.

**Business Value**

Müşterinin geçmiş başvurularına erişebilmesini ve başvuru geçmişini takip edebilmesini sağlar.

**Priority:** Medium

### Acceptance Criteria

**AC-001**

Given müşterinin daha önce oluşturulmuş kredi başvuruları vardır,

When müşteri başvuru geçmişi ekranını açar,

Then sistem müşteriye ait başvuruları listelemelidir.

**AC-002**

Given müşterinin birden fazla kredi başvurusu vardır,

When başvuru geçmişi görüntülenir,

Then sistem her başvuru için başvuru numarası, kredi ürünü, başvuru tarihi ve durum bilgisini göstermelidir.

---

# Definition of Done

Bir User Story'nin tamamlanmış kabul edilebilmesi için aşağıdaki kriterlerin karşılanması gerekmektedir:

* Gereksinim ile ilişkilendirilmiş olmalıdır.
* Acceptance Criteria tanımlanmış olmalıdır.
* Geliştirme tamamlanmış olmalıdır.
* Gerekli testler gerçekleştirilmiş olmalıdır.
* Kritik hatalar bulunmamalıdır.
* UAT süreci tamamlanmış olmalıdır.
* İlgili dokümantasyon güncellenmiş olmalıdır.
* Product Owner tarafından kabul edilmiş olmalıdır.
