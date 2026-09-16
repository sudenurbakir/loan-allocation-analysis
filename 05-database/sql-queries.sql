-- Loan Allocation Analysis
-- SQL Analysis Queries
-- Sample queries for business analysis purposes

/* =========================================================

1. Başvuru durumlarına göre kaç başvuru bulunmaktadır?
   ========================================================= */

SELECT
status,
COUNT(*) AS application_count
FROM loan_applications
GROUP BY status;

/* =========================================================
2. Onaylanan ve reddedilen başvuruların sayısı nedir?
========================================================= */

SELECT
decision,
COUNT(*) AS decision_count
FROM loan_decisions
GROUP BY decision;

/* =========================================================
3. Müşterilerin başvuru bilgilerini listeleme
========================================================= */

SELECT
c.customer_id,
c.first_name,
c.last_name,
la.application_id,
la.requested_amount,
la.status
FROM customers c
JOIN loan_applications la
ON c.customer_id = la.customer_id;

/* =========================================================
4. Kredi başvurusu ve kredi ürünü bilgilerini birlikte getirme
========================================================= */

SELECT
la.application_id,
lp.product_name,
la.requested_amount,
la.requested_term,
la.status
FROM loan_applications la
JOIN loan_products lp
ON la.product_id = lp.product_id;

/* =========================================================
5. Kredi skoru 1200'ün altında olan başvuruları bulma
========================================================= */

SELECT
la.application_id,
cs.credit_score,
la.status
FROM loan_applications la
JOIN credit_scores cs
ON la.application_id = cs.application_id
WHERE cs.credit_score < 1200;

/* =========================================================
6. Onaylanan kredi başvurularını listeleme
========================================================= */

SELECT
la.application_id,
c.first_name,
c.last_name,
la.requested_amount,
ld.decision
FROM loan_applications la
JOIN customers c
ON la.customer_id = c.customer_id
JOIN loan_decisions ld
ON la.application_id = ld.application_id
WHERE ld.decision = 'Approved';

/* =========================================================
7. Ürün bazında toplam kredi başvurusu sayısı
========================================================= */

SELECT
lp.product_name,
COUNT(la.application_id) AS application_count
FROM loan_products lp
LEFT JOIN loan_applications la
ON lp.product_id = la.product_id
GROUP BY lp.product_name;

/* =========================================================
8. Ürün bazında toplam talep edilen kredi tutarı
========================================================= */

SELECT
lp.product_name,
SUM(la.requested_amount) AS total_requested_amount
FROM loan_products lp
JOIN loan_applications la
ON lp.product_id = la.product_id
GROUP BY lp.product_name;

/* =========================================================
9. Ortalama talep edilen kredi tutarı
========================================================= */

SELECT
AVG(requested_amount) AS average_requested_amount
FROM loan_applications;

/* =========================================================
10. Kredi skoru ve tahsis kararını birlikte inceleme
========================================================= */

SELECT
la.application_id,
cs.credit_score,
ld.decision,
ld.decision_reason
FROM loan_applications la
JOIN credit_scores cs
ON la.application_id = cs.application_id
JOIN loan_decisions ld
ON la.application_id = ld.application_id;

/* =========================================================
11. Reddedilen başvuruların nedenleri
========================================================= */

SELECT
decision_reason,
COUNT(*) AS rejected_count
FROM loan_decisions
WHERE decision = 'Rejected'
GROUP BY decision_reason;

/* =========================================================
12. Kredi skoru 1200 ve üzeri olan başvurular
========================================================= */

SELECT
la.application_id,
cs.credit_score,
la.requested_amount
FROM loan_applications la
JOIN credit_scores cs
ON la.application_id = cs.application_id
WHERE cs.credit_score >= 1200;

/* =========================================================
13. Belirli tutarın üzerinde kredi talep eden başvurular
========================================================= */

SELECT
application_id,
requested_amount,
status
FROM loan_applications
WHERE requested_amount > 100000;

/* =========================================================
14. Müşteri bazında başvuru sayısı
========================================================= */

SELECT
c.customer_id,
c.first_name,
c.last_name,
COUNT(la.application_id) AS application_count
FROM customers c
LEFT JOIN loan_applications la
ON c.customer_id = la.customer_id
GROUP BY
c.customer_id,
c.first_name,
c.last_name;

/* =========================================================
15. Kredi ürünü limitini aşan başvurular
========================================================= */

SELECT
la.application_id,
lp.product_name,
la.requested_amount,
lp.max_amount
FROM loan_applications la
JOIN loan_products lp
ON la.product_id = lp.product_id
WHERE la.requested_amount > lp.max_amount;
