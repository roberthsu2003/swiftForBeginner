var letters = Set<Character>()
print(letters.count)

//加入內容
letters.insert("a")
print(letters)
//清空
letters = []

var favoriteGenres:Set<String> = ["Rock", "Classical", "Hip hop"]

var favoriteGenres1:Set = ["Rock", "Classical", "Hip hop"]
print(favoriteGenres.count)

if favoriteGenres1.isEmpty{
    print("空的")
}else{
    print("不是空的")
}
favoriteGenres1.insert("Jazz")
favoriteGenres1.insert("Jazz")
print(favoriteGenres1.count)
print(favoriteGenres1)
//移除
//optional binding
if let removeGenre = favoriteGenres1.remove("rock"){
    print("移除的內容是\(removeGenre)")
}else{
    print("沒有內容可以移除")
}
//檢查內容
if favoriteGenres1.contains("Funk"){
    print("有Funk")
}else{
    print("沒有Funk")
}
//取出所有元素
for genre in favoriteGenres1{
    print(genre)
}

//轉換為陣列
var arrayGenres = favoriteGenres1.sorted()
print(arrayGenres)
