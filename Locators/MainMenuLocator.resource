*** Variables ***
${MENU_LOCATOR}=                            //ul/li/a[span[text()="__MENU_NAME__"]] | //ul/li/a[@data-url="__DATA_URL__"]

&{GENERAL_MENU}=                            parent=${None}                              locator=${MENU_LOCATOR.replace("__DATA_URL__", "trang-chu")}

&{PRODUCT_MANAGEMENT_MENU}=                 parent=${None}                              locator=${MENU_LOCATOR.replace("__MENU_NAME__", "Quản Lý Sản Phẩm")}
&{PRODUCT_MENU}=                            parent=${PRODUCT_MANAGEMENT_MENU}           locator=${MENU_LOCATOR.replace("__DATA_URL__", "san-pham")}
&{SUPPLIERS_MENU}=                          parent=${PRODUCT_MANAGEMENT_MENU}           locator=${MENU_LOCATOR.replace("__DATA_URL__", "nha-cung-cap")}
&{PROMOTION_MENU}=                          parent=${PRODUCT_MANAGEMENT_MENU}           locator=${MENU_LOCATOR.replace("__DATA_URL__", "khuyen-mai")}
&{ROSE_MENU}=                               parent=${PRODUCT_MANAGEMENT_MENU}           locator=${MENU_LOCATOR.replace("__DATA_URL__", "hoa-hong")}
&{PRICES_FOR_STORES_MENU}=                  parent=${PRODUCT_MANAGEMENT_MENU}           locator=${MENU_LOCATOR.replace("__DATA_URL__", "dinh-gia-cua-hang")}

&{CUSTOMER_MANAGEMENT_MENU}=                parent=${None}                              locator=${MENU_LOCATOR.replace("__MENU_NAME__", "Quản Lý Khách Hàng")}
&{CUSTOMER_MENU}=                           parent=${CUSTOMER_MANAGEMENT_MENU}          locator=${MENU_LOCATOR.replace("__DATA_URL__", "khach-hang")}
&{CUSTOMER_GROUP_MENU}=                     parent=${CUSTOMER_MANAGEMENT_MENU}          locator=${MENU_LOCATOR.replace("__DATA_URL__", "nhom-khach-hang")}
&{ACCOUNT_RECIVABLE_MENU}=                  parent=${CUSTOMER_MANAGEMENT_MENU}          locator=${MENU_LOCATOR.replace("__DATA_URL__", "tai-khoan-phai-thu")}
&{ACCOUNT_GROUP_MENU}=                      parent=${CUSTOMER_MANAGEMENT_MENU}          locator=${MENU_LOCATOR.replace("__DATA_URL__", "nhom-tai-khoan-khach-hang")}
&{PURCHASE_LIMITS_MENU}=                    parent=${CUSTOMER_MANAGEMENT_MENU}          locator=${MENU_LOCATOR.replace("__DATA_URL__", "gioi-han-mua-hang")}

&{SALE_MANAGER_MENU}=                       parent=${None}                              locator=${MENU_LOCATOR.replace("__MENU_NAME__", "Quản Lý Bán Hàng")}
&{QUOTES_MENU}=                             parent=${SALE_MANAGER_MENU}                 locator=${MENU_LOCATOR.replace("__DATA_URL__", "bao-gia")}
&{PURCHASE_ORDERS_MENU}=                    parent=${SALE_MANAGER_MENU}                 locator=${MENU_LOCATOR.replace("__DATA_URL__", "don-dat-hang")}
&{SALES_MENU}=                              parent=${SALE_MANAGER_MENU}                 locator=${MENU_LOCATOR.replace("__DATA_URL__", "don-ban-hang")}
&{RETURN_CUSTOMERS_MENU}=                   parent=${SALE_MANAGER_MENU}                 locator=${MENU_LOCATOR.replace("__DATA_URL__", "khach-tra-hang")}

&{PURCHASING_MANAGEMENT_MENU}=              parent=${None}                              locator=${MENU_LOCATOR.replace("__MENU_NAME__", "Quản Lý Mua Hàng")}
&{PURCHASE_MENU}=                           parent=${PURCHASING_MANAGEMENT_MENU}        locator=${MENU_LOCATOR.replace("__DATA_URL__", "mua-hang")}
&{RETURNS_MENU}=                            parent=${PURCHASING_MANAGEMENT_MENU}        locator=${MENU_LOCATOR.replace("__DATA_URL__", "tra-hang")}
&{PURCHASE_HISTORY_MENU}=                   parent=${PURCHASING_MANAGEMENT_MENU}        locator=${MENU_LOCATOR.replace("__DATA_URL__", "lich-su-mua-hang")}

&{WAREHOUSE_MANAGEMENT_MENU}=               parent=${None}                              locator=${MENU_LOCATOR.replace("__MENU_NAME__", "Quản Lý Kho Hàng")}
&{DEPOT_MENU}=                              parent=${WAREHOUSE_MANAGEMENT_MENU}         locator=${MENU_LOCATOR.replace("__DATA_URL__", "kho-hang")}
&{REPOSITORY_INFORMATION_MENU}=             parent=${WAREHOUSE_MANAGEMENT_MENU}         locator=${MENU_LOCATOR.replace("__DATA_URL__", "thong-tin-kho")}
&{WAREHOUSE_INVENTORY_MENU}=                parent=${WAREHOUSE_MANAGEMENT_MENU}         locator=${MENU_LOCATOR.replace("__DATA_URL__", "kiem-ke-kho")}
&{WAREHOUSE_MENU}=                          parent=${WAREHOUSE_MANAGEMENT_MENU}         locator=${MENU_LOCATOR.replace("__DATA_URL__", "xuat-kho")}
&{WARHOUSING_MENU}=                         parent=${WAREHOUSE_MANAGEMENT_MENU}         locator=${MENU_LOCATOR.replace("__DATA_URL__", "nhap-kho")}
&{SUB_WAREHOUSE_MENU}=                      parent=${WAREHOUSE_MANAGEMENT_MENU}         locator=${MENU_LOCATOR.replace("__DATA_URL__", "kho-phu")}
&{SHIPMENT_HISTORY_MENU}=                   parent=${WAREHOUSE_MANAGEMENT_MENU}         locator=${MENU_LOCATOR.replace("__DATA_URL__", "lich-su-xuat-kho")}
&{WHAREHOUSING_HISTORY_MENU}=               parent=${WAREHOUSE_MANAGEMENT_MENU}         locator=${MENU_LOCATOR.replace("__DATA_URL__", "lich-su-nhap-kho")}

&{FINANCIAL_MANAGEMENT_MENU}=               parent=${None}                              locator=${MENU_LOCATOR.replace("__MENU_NAME__", "Quản Lý Tài Chính")}
&{CUSTOMER_LIABILITIES_MENU}=               parent=${FINANCIAL_MANAGEMENT_MENU}         locator=${MENU_LOCATOR.replace("__DATA_URL__", "cong-no-khach-hang")}
&{NCC_DEBT_MENU}=                           parent=${FINANCIAL_MANAGEMENT_MENU}         locator=${MENU_LOCATOR.replace("__DATA_URL__", "cong-no-nha-cung-cap")}
&{CASH_RECEIPTS_AND_EXPENDITURES_MENU}=     parent=${FINANCIAL_MANAGEMENT_MENU}         locator=${MENU_LOCATOR.replace("__DATA_URL__", "thu-chi-tien-mat")}
&{TAX_TYPE_MENU}=                           parent=${FINANCIAL_MANAGEMENT_MENU}         locator=${MENU_LOCATOR.replace("__DATA_URL__", "quan-ly-thue")}
&{TAX_GROUP_MENU}=                          parent=${FINANCIAL_MANAGEMENT_MENU}         locator=${MENU_LOCATOR.replace("__DATA_URL__", "nhom-thue")}

&{TRANSPORTATION_MANAGEMENT_MENU}=          parent=${None}                              locator=${MENU_LOCATOR.replace("__MENU_NAME__", "Quản Lý Vận Chuyển")}
&{SHIPPING_OVERVIEW_MENU}=                  parent=${TRANSPORTATION_MANAGEMENT_MENU}    locator=${MENU_LOCATOR.replace("__DATA_URL__", "tong-quan-van-chuyen")}
&{BILL_OF_LADING_MENU}=                     parent=${TRANSPORTATION_MANAGEMENT_MENU}    locator=${MENU_LOCATOR.replace("__DATA_URL__", "van-don")}
&{RECONCILIATION_MENU}=                     parent=${TRANSPORTATION_MANAGEMENT_MENU}    locator=${MENU_LOCATOR.replace("__DATA_URL__", "doi-soat-van-chuyen")}

&{DIRECTORY_MENU}=                          parent=${None}                              locator=${MENU_LOCATOR.replace("__MENU_NAME__", "Danh Mục")}
&{UNIT_OF_CALCULATION_MENU}=                parent=${DIRECTORY_MENU}                    locator=${MENU_LOCATOR.replace("__DATA_URL__", "don-vi-tinh")}
&{GENRE_MENU}=                              parent=${DIRECTORY_MENU}                    locator=${MENU_LOCATOR.replace("__DATA_URL__", "the-loai")}
&{STAND_MENU}=                              parent=${DIRECTORY_MENU}                    locator=${MENU_LOCATOR.replace("__DATA_URL__", "gian-hang")}
&{REASON_MENU}=                             parent=${DIRECTORY_MENU}                    locator=${MENU_LOCATOR.replace("__DATA_URL__", "ly-do")}

&{REPORT_MENU}=                             parent=${None}                              locator=${MENU_LOCATOR.replace("__MENU_NAME__", "Báo Cáo")}
&{QUOTE_REPORT_MENU}=                       parent=${REPORT_MENU}                       locator=${MENU_LOCATOR.replace("__DATA_URL__", "bao-cao")}
&{PURCHASE_ORDER_MENU}=                     parent=${REPORT_MENU}                       locator=${MENU_LOCATOR.replace("__DATA_URL__", "bao-cao-mua-hang-dat-hang")}
&{SALES_REVENUE_MENU}=                      parent=${REPORT_MENU}                       locator=${MENU_LOCATOR.replace("__DATA_URL__", "bao-cao-doanh-thu")}
&{EXPORT_IMPORT_EXIST_MENU}=                parent=${REPORT_MENU}                       locator=${MENU_LOCATOR.replace("__DATA_URL__", "bao-cao-xuat-nhap-ton")}

&{ADMINISTER_MENU}=                         parent=${None}                              locator=${MENU_LOCATOR.replace("__MENU_NAME__", "Quản Trị")}
&{STORE_MENU}=                              parent=${ADMINISTER_MENU}                   locator=${MENU_LOCATOR.replace("__DATA_URL__", "cua-hang")}
&{STORE_GROUP_MENU}=                        parent=${ADMINISTER_MENU}                   locator=${MENU_LOCATOR.replace("__DATA_URL__", "nhom-cua-hang")}
&{SALES_REPRESENTATIVE_MENU}=               parent=${ADMINISTER_MENU}                   locator=${MENU_LOCATOR.replace("__DATA_URL__", "dai-dien-ban-hang")}
&{EMPLOYEE_MENU}=                           parent=${ADMINISTER_MENU}                   locator=${MENU_LOCATOR.replace("__DATA_URL__", "nhan-vien")}

&{OMNICHANNEL_MENU}=                        parent=${None}                              locator=${MENU_LOCATOR.replace("__MENU_NAME__", "Bán hàng đa kênh")}
&{WEBSITE_CHANNEL_MENU}=                    parent=${OMNICHANNEL_MENU}                  locator=${MENU_LOCATOR.replace("__DATA_URL__", "kenh-web")}

&{SYSTEM_CONFIGURATION_MENU}=               parent=${None}                              locator=${MENU_LOCATOR.replace("__MENU_NAME__", "Cấu Hình Hệ Thống")}

&{SYSCFG_GENERAL_MENU}=                     parent=${None}                              locator=${MENU_LOCATOR.replace("__MENU_NAME__", "Chung")}
&{DISPLAY_DECIMALS_MENU}=                   parent=${SYSCFG_GENERAL_MENU}               locator=${MENU_LOCATOR.replace("__DATA_URL__", "cau-hinh/so-thap-phan")}
&{COMPANY_INFORMATION_MENU}=                parent=${SYSCFG_GENERAL_MENU}               locator=${MENU_LOCATOR.replace("__DATA_URL__", "cau-hinh/thong-tin-cong-ty")}
&{PRODUCT_PRICE_ADJUSTMENT_MENU}=           parent=${SYSCFG_GENERAL_MENU}               locator=${MENU_LOCATOR.replace("__DATA_URL__", "cau-hinh/gia-san-pham")}
&{WAREHOUSE_INFORMATION_MENU}=              parent=${SYSCFG_GENERAL_MENU}               locator=${MENU_LOCATOR.replace("__DATA_URL__", "cau-hinh/thong-tin-kho-hang")}
&{SELF_INCREASING_CODES_MENU}=              parent=${SYSCFG_GENERAL_MENU}               locator=${MENU_LOCATOR.replace("__DATA_URL__", "cau-hinh/ma-tu-tang")}
&{EXPORT_APPROVAL_MENU}=                    parent=${SYSCFG_GENERAL_MENU}               locator=${MENU_LOCATOR.replace("__DATA_URL__", "cau-hinh/xuat-nhap-kho")}
&{PRINT_TEMPLATES_MENU}=                    parent=${SYSCFG_GENERAL_MENU}               locator=${MENU_LOCATOR.replace("__DATA_URL__", "cau-hinh/mau-in")}

&{ANNOUNCEMENT_MENU}=                       parent=${None}                              locator=${MENU_LOCATOR.replace("__MENU_NAME__", "Thông Báo")}
&{ADD_RECIPIENTS_MENU}=                     parent=${ANNOUNCEMENT_MENU}                 locator=${MENU_LOCATOR.replace("__DATA_URL__", "cau-hinh/them-nguoi-nhan")}

&{PLACE_AN_ORDER_MENU}=                     parent=${None}                              locator=${MENU_LOCATOR.replace("__MENU_NAME__", "Đặt hàng")}
&{CUSTOMER_ORDERS_MENU}=                    parent=${PLACE_AN_ORDER_MENU}               locator=${MENU_LOCATOR.replace("__DATA_URL__", "cau-hinh/dat-hang")}
&{PURCHASE_ORDERS_CFG_MENU}=                parent=${PLACE_AN_ORDER_MENU}               locator=${MENU_LOCATOR.replace("__DATA_URL__", "cau-hinh/don-hang")}

&{EMAIL_MENU}=                              parent=${None}                              locator=${MENU_LOCATOR.replace("__MENU_NAME__", "Email")}
&{SYSTEM_EMAIL_MENU}=                       parent=${EMAIL_MENU}                        locator=${MENU_LOCATOR.replace("__DATA_URL__", "cau-hinh/email-cua-hang")}
&{EMAIL_TEMPLATES_MENU}=                    parent=${EMAIL_MENU}                        locator=${MENU_LOCATOR.replace("__DATA_URL__", "cau-hinh/mau-email")}

&{SYSCFG_PRODUCT_MENU}=                     parent=${None}                              locator=${MENU_LOCATOR.replace("__MENU_NAME__", "Sản Phẩm")}
&{SYSCFG_REASON_MENU}=                      parent=${SYSCFG_PRODUCT_MENU}               locator=${MENU_LOCATOR.replace("__MENU_NAME__", "Lý Do")}
&{SYSCFG_ACCOUNTS_RECEIVABLE_MENU}=         parent=${SYSCFG_PRODUCT_MENU}               locator=${MENU_LOCATOR.replace("__MENU_NAME__", "Tài Khoản Phải Thu")}
&{SYSCFG_SHIPPING_FOR_STORES}=              parent=${SYSCFG_PRODUCT_MENU}               locator=${MENU_LOCATOR.replace("__MENU_NAME__", "Vận chuyển cho cửa hàng")}
&{SYSCFG_SHIPPING_PARTNERS}=                parent=${SYSCFG_PRODUCT_MENU}               locator=${MENU_LOCATOR.replace("__MENU_NAME__", "Đối Tác Vận Chuyển")}
