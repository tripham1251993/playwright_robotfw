*** Settings ***
Resource        ../Resources/MainMenu.resource
Suite Setup     Login To Store    ${TENANT_NAME}    ${ADMIN_USERNAME}    ${ADMIN_PASSWORD}    ${STORE_NAME}

*** Test Cases ***
Test Open Sub Menus Of Customer Management
    Open Menu    ${CUSTOMER_MENU}
    Current Page Url Should End With    /khach-hang
    Page Title Should Be    Khách hàng - Quản Lý Cửa Hàng

    Open Menu    ${CUSTOMER_GROUP_MENU}
    Current Page Url Should End With    /nhom-khach-hang
    Page Title Should Be    Nhóm khách hàng - Quản Lý Cửa Hàng

Test Open Sub Menus Of Sale Management
    Open Menu    ${SALES_MENU}
    Current Page Url Should End With    /don-ban-hang
    Page Title Should Be    Bán hàng - Quản Lý Cửa Hàng

    Open Menu    ${QUOTES_MENU}
    Current Page Url Should End With    /bao-gia
    Page Title Should Be    Báo giá - Quản Lý Cửa Hàng