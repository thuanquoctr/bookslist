package com.example.ASM.entity;

import lombok.*;

@Getter
@RequiredArgsConstructor
public enum oder_status {
    CHUA_XAC_NHAN("Chưa xác nhận"),
    DA_XAC_NHAN("Đã xác nhận,Đang chờ vận chuyển"),
    DANG_GIAO_HANG("Đang giao hàng"),
    DA_GIAO_HANG("Đã giao hàng"),
    DA_HUY("Đã hủy");

    private final String description;
}
