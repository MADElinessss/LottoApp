//
//  LottoAPIManager.swift
//  LottoApp
//
//  Created by Madeline on 2024/01/16.
//

import Alamofire
import Foundation

struct LottoAPIManager {
    func callRequest(_ number: Int, completionHandler: @escaping ([Int]) -> Void) {
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(number)"
        AF.request(url).responseDecodable(of: Lotto.self) { response in
            switch response.result {
            case .success(let success):
                completionHandler([success.drwtNo1, success.drwtNo2, success.drwtNo3, success.drwtNo4, success.drwtNo5, success.drwtNo6])
            case .failure(let failure):
                dump(failure)
            }
        }
    }
}
