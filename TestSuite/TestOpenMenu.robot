*** Settings ***
Resource        ../Resources/MainMenu.resource
Test Setup     Login To Store    ${TENANT_NAME}    ${ADMIN_USERNAME}    ${ADMIN_PASSWORD}    ${STORE_NAME}

*** Test Cases ***
Test Open Sub Menu Of Product Management Menu
    Open Menu    ${PRODUCT_MENU}
    Current Page Url Should End With    /san-pham
    Page Title Should Be    Sản phẩm - Quản Lý Cửa Hàng

    Open Menu    ${SUPPLIERS_MENU}
    Current Page Url Should End With    /nha-cung-cap
    Page Title Should Be    Nhà cung cấp - Quản Lý Cửa Hàng

Test Open Sub Menu Of Customer Management Menu
    Open Menu    ${CUSTOMER_MENU}
    Current Page Url Should End With    /khach-hang
    Page Title Should Be    Khách hàng - Quản Lý Cửa Hàng

    Open Menu    ${CUSTOMER_GROUP_MENU}
    Current Page Url Should End With    /nhom-khach-hang
    Page Title Should Be    Nhóm khách hàng - Quản Lý Cửa Hàng