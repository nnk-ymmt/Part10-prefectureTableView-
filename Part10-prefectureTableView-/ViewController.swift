//
//  ViewController.swift
//  Part10-prefectureTableView-
//
//  Created by 山本ののか on 2020/12/07.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            let cellNib = UINib(nibName: "TableViewCell", bundle: nil)
            tableView.register(cellNib, forCellReuseIdentifier: "TableViewCell")
            tableView.isHidden = true
        }
    }

    private let prefectures = ["北海道", "青森県", "岩手県", "宮城県", "秋田県", "山形県", "福島県", "茨城県", "栃木県",
                       "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県", "新潟県", "富山県", "石川県", "福井県",
                       "山梨県", "長野県", "岐阜県", "静岡県", "愛知県", "三重県", "滋賀県", "京都府", "大阪府",
                       "兵庫県", "奈良県", "和歌山県", "鳥取県", "島根県", "岡山県", "広島県", "山口県", "徳島県",
                       "香川県", "愛媛県", "高知県", "福岡県", "佐賀県", "長崎県", "熊本県", "大分県", "宮崎県",
                       "鹿児島県", "沖縄県"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isHidden = false
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        prefectures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        let backgroundColors: [UIColor] = [.red, .green, .blue]
        cell.configure(title: prefectures[indexPath.row],
                       subTitle: "\(indexPath.row + 1)番目の都道府県です",
                       color: backgroundColors[indexPath.row % 3])
        return cell
    }
}



// 改善点

// 複数の画面でこのセルを使い回す場合、subTitleの内容が画面によって変わってくるのであれば
// subTitleをどうするかは各画面が持つべき知識なので、ViewController側で文字列を整形してセルに渡した方が良い
// 逆にsubTitleが全画面で共通なアプリなのであれば、subTitleをどうするかはセルが持つべき知識になるので、この場合はセルにはrowだけ渡すことになる

// また、何でもかんでもViewControllerに寄せてしまうと、ViewControllerが全てを知ってしまって肥えてしまう
// その観点から、基本的に表示のロジックはカスタムセル側に寄せると良い
