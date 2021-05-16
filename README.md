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

なお、 [RxSwift](https://github.com/ReactiveX/RxSwift) を導入すると、d次のように count の変化に対して Label を紐付けることで、 count の値が変われば、表示される Label の内容も変わるようになります。

- branch: [rx](https://github.com/ykws/CustomDataSourceExample/tree/rx)

```swift
let count = BehaviorRelay(value: 0)


count.map { String($0) }
    .bind(to: customView.counter.rx.text)
    .disposed(by: disposeBag)
```

UITableView もそうですが、 CustomView で reloadData を呼ぶとそこで描画の更新が走り、 DataSource protocol の実装に従って更新する内容が決定されます。

一方 RxSwift では、更新のタイミングは Rx に任せ、データの値が変わった時の表示反映を宣言するだけで実現可能になっています。
