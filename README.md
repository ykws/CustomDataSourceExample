# Custom DataSource Example

CustomView に対して UITableView と同じように DataSource protocol を提供するとしたら、どのように実現できるか検証します。

UITableView では Cell という繰り返し表示する要素に対して、 DataSource protocol を通し、任意のデータを表示できるように、そのデータの設定を委譲しています。
CustomView でも UITableView では表現できない繰り返しの要素がある場合は効果的ですが、そうではない場合、過剰となる可能性が高いです。

UITableViewDataSource を実装した ViewController では、次のように IndexPath に応じて Cell にデータを設定して返します。

[UITableViewDataSource](https://developer.apple.com/documentation/uikit/uitableviewdatasource)

```swift
// Provide a cell object for each row.
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   // Fetch a cell of the appropriate type.
   let cell = tableView.dequeueReusableCell(withIdentifier: "cellTypeIdentifier", for: indexPath)
   
   // Configure the cell’s contents.
   cell.textLabel!.text = "Cell text"
       
   return cell
}
```

CustomViewDataSource を実装した ViewController では、次のように Label にデータを設定して返します。

```swift
// Provide a label object
func customView(_ customView: CustomView, label: UILabel) -> UILabel {
    label.text = "Label text"
    return label
}
```
