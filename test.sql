-- APPS.XXT_BC_FACTUAL_REQ_HEADERS_V исходный текст

CREATE OR REPLACE FORCE VIEW "APPS"."XXT_BC_FACTUAL_REQ_HEADERS_V" ("ROW_ID", "FACTUAL_REQ_HEADER_ID", "LAST_UPDATE_DATE", "LAST_UPDATED_BY", "CREATION_DATE", "CREATED_BY", "LAST_UPDATE_LOGIN", "PAY_TYPE", "PAY_TYPE_MEANING", "FACTUAL_REQ_TYPE", "FACTUAL_REQ_TYPE_MEANING", "FILIAL_FINANCING", "MANUAL_ENTRY", "LINES_EXISTS", "CONTRACTOR_ID", "CONTRACTOR_CODE", "CONTRACTOR_NAME", "INN", "CONTRACTOR_SITE_ID", "CONTRACTOR_SITE_CODE", "KPP", "PENALTY_PROVISION", "PAY_THRU_DATE", "CONTRACT_ID", "CONTRACT", "CONTRACT_CYCLE_ID", "CONTRACT_STAGE_ID", "CONTRACT_STAGE_NAME", "FACTUAL_REQ_NUM", "FACTUAL_REQ_DATE", "PLANNED_DATE", "AMOUNT", "CURRENCY_CODE", "CURRENCY_CONVERSION_RATE", "CURRENCY_CONVERSION_TYPE", "CONVERSION_TYPE_NAME", "CURRENCY_CONVERSION_DATE", "BASE_AMOUNT", "STATUS", "STATUS_MEANING", "GIVEN_FOR_PAYING_FLAG", "THIRD_PART_PAYMENT_FLAG", "BUDGET_CTL_PASSED_FLAG", "BC_CC_ID", "RECEIVER_BANK_ACCOUNT_ID", "RECEIVER_BANK_ACCOUNT_NUM", "RECEIVER_BANK_BRANCH_ID", "RECEIVER_BANK_BRANCH_NAME", "RECEIVER_BIK", "RECEIVER_CORR_ACC", "RECEIVER_BANK_ACCOUNT_FLAG", "PAYER_BANK_ACCOUNT_ID", "PAYER_BANK_ACCOUNT_NUM", "PAYER_BANK_BRANCH_ID", "PAYER_BANK_BRANCH_NAME", "PAYER_BIK", "PAYER_CORR_ACC", "PAYER_BANK_ACCOUNT_FLAG", "PAYMENT_DESTINATION", "DOC_CATEGORY_CODE", "REASON_DOC_NUM", "REASON_DOC_AMOUNT", "REASON_DOC_DATE", "PREPAY_CC_ID", "ACCTS_PAY_CC_ID", "MOTIVATION", "WO_HDG_BUGGET_ITEM_FLAG", "ATTRIBUTE_CATEGORY_CODE", "ATTRIBUTE1", "ATTRIBUTE2", "ATTRIBUTE3", "ATTRIBUTE4", "ATTRIBUTE5", "ATTRIBUTE6", "ATTRIBUTE7", "ATTRIBUTE8", "ATTRIBUTE9", "ATTRIBUTE10", "ATTRIBUTE11", "ATTRIBUTE12", "ATTRIBUTE13", "ATTRIBUTE14", "ATTRIBUTE15", "COMMENTS", "CONTEXT", "CONTEXT_VALUE1", "CONTEXT_VALUE2", "CONTEXT_VALUE3", "CONTEXT_VALUE4", "CONTEXT_VALUE5", "CONTEXT_VALUE6", "CONTEXT_VALUE7", "CONTEXT_VALUE8", "CONTEXT_VALUE9", "CONTEXT_VALUE10", "CONTEXT_VALUE11", "CONTEXT_VALUE12", "CONTEXT_VALUE13", "CONTEXT_VALUE14", "CONTEXT_VALUE15", "INITIATOR", "REGISTRY_NUM", "SEGMENT1", "SEGMENT2", "SEGMENT3", "SEGMENT4", "SEGMENT5", "SEGMENT6", "SEGMENT7", "SEGMENT8", "SEGMENT9", "SEGMENT10", "SEGMENT11", "SEGMENT12", "SEGMENT13", "SEGMENT14", "SEGMENT15", "ORG_ID", "INVOICE_ID", "PURCHASING_ITEM", "ACTIVITY_TYPE", "IS_INVEST_ACTIVITY", "IS_OPER_ACTIVITY", "FINANCE_SOURCE", "BUDGET_ITEM_NAME", "PAYMENT_STATUS", "BALANCE_ENABLED", "INVESTED_FILIAL_CODE", "INVESTED_FILIAL_NAME", "INVESTED_FILIAL_ORG_ID", "EVENT_KEY", "SOURCE", "DOC_DATE", "LETTER_OF_CREDIT", "DOC_NUM", "ACCEPTANCE_DATE", "DUE_DAYS") AS
  SELECT a.ROWID row_id,
          a.factual_req_header_id,
          a.last_update_date,
          a.last_updated_by,
          a.creation_date,
          a.created_by,
          a.last_update_login,
          a.pay_type,
          pt.pay_type_meaning,
          a.factual_req_type,
          rt.factual_req_type_meaning,
          rt.filial_financing,
          rt.manual_entry,
          rt.lines_exists,
          a.contractor_id,
          c.contractor_code,
          c.contractor_name,
          c.inn,
          a.contractor_site_id,
          cs.contractor_site_code,
          cs.kpp,
          cs.penalty_provision,
          a.pay_thru_date,
          a.contract_id,
          a.contract,
          a.contract_cycle_id,
          a.contract_stage_id,
          '' contract_stage_name,
          a.factual_req_num,
          a.factual_req_date,
          a.planned_date,
          a.amount,
          a.currency_code,
          a.currency_conversion_rate,
          a.currency_conversion_type,
          ct.conversion_type_name,
          a.currency_conversion_date,
          a.base_amount,
          a.status,
          rs.status_meaning,
          a.given_for_paying_flag,
          a.third_part_payment_flag,
          a.budget_ctl_passed_flag,
          a.bc_cc_id,
          a.receiver_bank_account_id,
          rba.bank_account_num receiver_bank_account_num,
          a.receiver_bank_branch_id,
          rb.bank_branch_name receiver_bank_branch_name,
          rb.bik receiver_bik,
          rb.corr_acc receiver_corr_acc,
          DECODE(a.receiver_bank_account_id, NULL, 'N', 'Y') receiver_bank_account_flag,
          a.payer_bank_account_id,
          pba.bank_account_num payer_bank_account_num,
          a.payer_bank_branch_id,
          pb.bank_branch_name payer_bank_branch_name,
          pb.bik payer_bik,
          pb.corr_acc payer_corr_acc,
          DECODE (a.payer_bank_account_id, NULL, 'N', 'Y') payer_bank_account_flag,
          a.payment_destination,
          a.doc_category_code,
          a.reason_doc_num,
          a.reason_doc_amount,
          a.reason_doc_date,
          a.prepay_cc_id,
          a.accts_pay_cc_id,
          a.motivation,
          a.wo_hdg_bugget_item_flag,
          a.attribute_category_code,
          a.attribute1,
          a.attribute2,
          a.attribute3,
          a.attribute4,
          a.attribute5,
          a.attribute6,
          a.attribute7,
          a.attribute8,
          a.attribute9,
          a.attribute10,
          a.attribute11,
          a.attribute12,
          a.attribute13,
          a.attribute14,
          a.attribute15,
          a.comments,
          a.context,
          a.context_value1,
          a.context_value2,
          a.context_value3,
          a.context_value4,
          a.context_value5,
          a.context_value6,
          a.context_value7,
          a.context_value8,
          a.context_value9,
          a.context_value10,
          a.context_value11,
          a.context_value12,
          a.context_value13,
          a.context_value14,
          a.context_value15,
          a.initiator,
          a.context_value1 registry_num,
          cc.segment1,
          cc.segment2,
          cc.segment3,
          cc.segment4,
          cc.segment5,
          cc.segment6,
          cc.segment7,
          cc.segment8,
          cc.segment9,
          cc.segment10,
          cc.segment11,
          cc.segment12,
          cc.segment13,
          cc.segment14,
          cc.segment15,
          a.org_id,
          a.invoice_id,
          a.purchasing_item,
          act.activity_type,
          act.is_invest_activity,
          act.is_oper_activity,
          --
          bi2.finance_source AS finance_source,
          bi2.budget_item_name AS budget_item_name,
          CASE
             WHEN a.status = 'PRIMARY'
             THEN
                (SELECT
                       CASE
                          WHEN     (  SUM (DISTINCT (SELECT tt.amount
                                                       FROM XXT_BC_FACTUAL_REQ_HEADERS_ALL tt
                                                      WHERE tt.factual_req_header_id = a.factual_req_header_id))
                                    - SUM (t.amount)) = 0
                               AND SUM (t.amount) != 0
                          THEN
                             'Оплачено'
                          WHEN     (  SUM (DISTINCT (SELECT tt.amount
                                                       FROM XXT_BC_FACTUAL_REQ_HEADERS_ALL tt
                                                      WHERE tt.factual_req_header_id = a.factual_req_header_id))
                                    - SUM (t.amount)) > 0
                               AND SUM (t.amount) != 0
                          THEN
                             'Частично оплачено'
                          ELSE
                             'Не оплачено'
                       END
                          AS payment_status
                  FROM xxt_bc_references_all r, XXT_BC_FACTUAL_REQ_HEADERS_ALL t
                 WHERE LINK_TABLE_FROM = 'XXT_BC_FACTUAL_REQ_HEADERS_ALL' AND LINK_ID_TO = t.factual_req_header_id AND LINK_ID_FROM = a.factual_req_header_id AND r.LINK_TYPE IN ('FREQ_PARTIAL', 'FREQ_TRNSFR_NEW') AND t.status = 'PAYMENT_CREATED')
             ELSE
                (SELECT
                       MIN (ALC3.DISPLAYED_FIELD) CHECK_STATUS
                   FROM xxt_bc_references_v rch, AP_LOOKUP_CODES ALC3, ap_checks_all ch
                  WHERE     rch.link_table_to = 'AP_CHECKS_ALL'
                        AND rch.link_table_from = 'XXT_BC_FACTUAL_REQ_HEADERS_ALL'
                        AND rch.link_id_from = a.factual_req_header_id
                        AND rch.link_id_to = ch.check_id
                        AND ALC3.LOOKUP_TYPE = 'CHECK STATE'
                        AND ALC3.LOOKUP_CODE = ch.STATUS_LOOKUP_CODE)
          END
             AS payment_status,
          --
          a.balance_enabled,
          cs.filial_code invested_filial_code,
          cs.filial_name invested_filial_name,
          cs.filial_org_id invested_filial_org_id,
          a.event_key,
          a.source,
          a.doc_date
         ,(SELECT max(inv.attribute12)
             FROM AP_INVOICES_all inv
            WHERE inv.attribute_category LIKE 'RMS13_IMP%' AND NVL (a.reason_doc_num, a.doc_category_code) = inv.invoice_num AND inv.vendor_id = a.contractor_id
		  )
             AS letter_of_credit
         ,nvl(DOC_CATEGORY_CODE,reason_doc_num) doc_num
         ,a.acceptance_date
         ,cs.due_days
     FROM xxt_bc_factual_req_headers_all a,
          xxt_bc_pay_type_v pt,
          xxt_bc_factual_req_type_v rt,
          xxt_bc_contractor_v c,
          xxt_bc_contractor_site_v cs,
          xxt_bc_conversion_types_v ct,
          xxt_bc_factual_req_status_v rs,
          xxt_bc_bank_branch_v rb,
          xxt_bc_bank_branch_v pb,
          (SELECT DISTINCT bank_account_id,
                           vendor_site_id,
                           org_id,
                           bank_account_num
             FROM xxt_bc_bank_accounts_v
            WHERE account_type = 'SUPPLIER') rba,
          (SELECT DISTINCT bank_account_id, bank_account_num
             FROM xxt_bc_bank_accounts_v
            WHERE account_type = 'INTERNAL') pba,
          xxt_bc_code_combinations cc,
          xxt_bc_activity_type_v act,
          (SELECT bi2.budget_item_code,
                  bi2.budget_item_name,
                  bi2.finance_source,
                  bi2.activity_type
             FROM xxt_bc_budget_item_v bi2) bi2
    WHERE     a.pay_type = pt.pay_type_code(+)
          AND a.factual_req_type = rt.factual_req_type_code(+)
          AND a.contractor_id = c.contractor_id(+)
          AND a.contractor_site_id = cs.contractor_site_id(+)
          AND a.currency_conversion_type = ct.conversion_type_code(+)
          AND a.status = rs.status_code(+)
          AND a.receiver_bank_branch_id = rb.bank_branch_id(+)
          AND a.payer_bank_branch_id = pb.bank_branch_id(+)
          AND a.receiver_bank_account_id = rba.bank_account_id(+)
          AND a.contractor_site_id = rba.vendor_site_id(+)
          AND a.org_id = rba.org_id(+)
          --and a.org_id                   = cs.org_id ( + )
          AND a.payer_bank_account_id = pba.bank_account_id(+)
          --and a.contractor_site_id       = pba.vendor_site_id ( + ) -- have no vendor_site_id
          --and a.org_id                   = pba.org_id ( + )         -- have no org_id
          AND a.bc_cc_id = cc.code_combination_id(+)
          --   and a.activity_type            = act.activity_type( + )
          AND cc.segment2 = bi2.budget_item_code(+)
          AND bi2.activity_type = act.activity_type(+)
          AND XXT_SEQURITY.IS_HAS_ACCESS (a.ATTRIBUTE8) > 0
;

GRANT SELECT ON "APPS"."XXT_BC_FACTUAL_REQ_HEADERS_V" TO "USR_LMDE";