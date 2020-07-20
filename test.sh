#!/bin/bash
END=$(date -d "31-01-2020" +%s);
DATE=$(date -d "01-01-2020" +%s); 
while [[ "$DATE" -le "$END" ]]; do date -d "@$DATE" +%F; let DATE+=86400; done


