//
//  ReCordViewController.swift
//  Fit-Squad
//
//  Created by 김동준 on 2022/02/03.
//

import Foundation

class RecordViewController: BaseViewController {
    lazy var v = RecordView(frame: view.frame)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = v
    }
}



#if DEBUG
import SwiftUI

extension UIViewController {
   private struct Preview: UIViewControllerRepresentable {
           let viewController: UIViewController

           func makeUIViewController(context: Context) -> UIViewController {
               return viewController
           }

           func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
           }
       }

       func toPreview() -> some View {
           Preview(viewController: self)
       }
}

struct PreView: PreviewProvider {
   static var previews: some View {
       RecordViewController().toPreview()
   }
}
#endif
