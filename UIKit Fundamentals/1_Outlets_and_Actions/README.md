# Outlets and Actions

## Click Counter

![Click Counter](./Click Counter.png) ![Diagram](./Diagram.png) 

이번에는 StoryBoard를 사용하지 않고 위의 App을 만들거임ㅇㅇ


All View Controllers inherit a view property. 그래서 기본 ViewContoller는 기본View의 view 프로퍼티를 가지고있다. 그것을 이용해 `self.view.addSubview()`로 `label`과 `button`을 추가했다.

UIButton은 Control Object라고 불리는 View Object의 카테고리에 속해있다. Control Object는 사용자의 터치와 같은 액션을 이벤트로 바꿔줍니다. 버튼안에 Object를 생성해서 클릭되었을 떄 ViewController와 접촉하도록 해야한다. 이것을 **타겟 액션**이라고 하며, 이것으로부터 IBAction이 파생되었다.

이 **타겟 액션**은 세가지 정보를 가지고 있당.  
1. Object to notify target
1. Method to use action
1. Event that will trigger the target/action

아래는 결과코드.
```swift
import UIKit

class ViewController: UIViewController {

    var count: Int = 0
    var label:UILabel!

    override func viewDidLoad() {
    super.viewDidLoad()


    // Label 생성
    var label = UILabel()
    label.frame = CGRect(x: 150, y: 150, width: 60, height: 60)
    label.text = "0"
    self.view.addSubview(label)
    self.label = label

    // Button 생성
    var button = UIButton()
    button.frame = CGRect.init(x: 150, y: 250, width: 60, height: 60)
    button.setTitle("Click", for: .normal)
    button.setTitleColor(UIColor.blue, for: .normal)
    self.view.addSubview(button)

    button.addTarget(self, action: #selector(ViewController.incrementCount), for: UIControlEvents.touchUpInside)
    }

    func incrementCount() {
        self.count = self.count + 1
        self.label.text = "\(self.count)"
    }

}
```
`

위의 `incrementCount()`와 같은 메소드는 CallBack Method로 불리기도한다. (버튼의 코드를 바꾸는 것이아니라 controller의 코드를 이용하기때문에?) Action은 view에서 ViewController로 돌아오는 메소드이다. Outlet은 그 반대.
