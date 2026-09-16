# Non-Functional Requirements

## 1. Genel Bakış

Non-Functional Requirements, kredi başvuru sisteminin fonksiyonlarından bağımsız olarak sahip olması gereken performans, güvenlik, kullanılabilirlik ve güvenilirlik kriterlerini tanımlamaktadır.

## 2. Gereksinimler

### NFR-001 — Performans

Sistem, standart kredi başvuru işlemlerinde kullanıcı isteğine makul süre içerisinde yanıt vermelidir.

### NFR-002 — Kullanılabilirlik

Kredi başvuru ekranları kullanıcıların başvuru adımlarını kolayca anlayabileceği ve takip edebileceği şekilde tasarlanmalıdır.

### NFR-003 — Güvenlik

Kullanıcıların yalnızca kendilerine ait kredi başvurularını görüntüleyebilmesi sağlanmalıdır.

### NFR-004 — Veri Gizliliği

Müşteriye ait kişisel ve finansal bilgiler yetkisiz kullanıcıların erişimine karşı korunmalıdır.

### NFR-005 — Veri Bütünlüğü

Kredi başvurularına ait kritik bilgiler sistem içerisinde tutarlı ve doğru şekilde saklanmalıdır.

### NFR-006 — Kullanılabilirlik Sürekliliği

Kredi başvuru hizmeti, planlı bakım süreçleri dışında kullanıcıların erişimine açık olmalıdır.

### NFR-007 — Hata Yönetimi

Sistem beklenmeyen bir hata oluştuğunda kullanıcıya teknik detayları göstermeden anlaşılır bir hata mesajı sunmalıdır.

### NFR-008 — İzlenebilirlik

Kredi başvurularının durum değişiklikleri sistem üzerinde takip edilebilir olmalıdır.

### NFR-009 — Ölçeklenebilirlik

Sistem, artan kredi başvuru hacmini karşılayabilecek şekilde ölçeklenebilir bir yapıda tasarlanmalıdır.

### NFR-010 — Loglama

Kritik sistem işlemleri gerektiğinde incelenebilmesi amacıyla uygun şekilde loglanmalıdır.

## 3. NFR Öncelikleri

| ID      | Kategori       | Öncelik |
| ------- | -------------- | ------- |
| NFR-001 | Performance    | High    |
| NFR-002 | Usability      | Medium  |
| NFR-003 | Security       | High    |
| NFR-004 | Data Privacy   | High    |
| NFR-005 | Data Integrity | High    |
| NFR-006 | Availability   | High    |
| NFR-007 | Error Handling | Medium  |
| NFR-008 | Traceability   | High    |
| NFR-009 | Scalability    | Medium  |
| NFR-010 | Logging        | Medium  |
