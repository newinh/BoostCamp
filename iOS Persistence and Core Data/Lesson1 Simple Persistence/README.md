# Simple Persistence

## UserDefaults

 - Great for storing user preferences and other simple things.
 - Saves data in a plist file (property list file).
 - Can only store the following data types: `Data`, `String`, `Number`, `Date`, `Array`, and `Dictionary`.
 - When storing (writing) the file or accessing (reading) the file, `UserDefaults` does it *all at once*, possibly creating long/unnecessary I/O time.
 - It’s a good idea to keep UserDefaults under *1MB*.


App의 설정 상태 같은 간단한 정보를 기록하기에 적합하다.


`UserDefaults.standard`
