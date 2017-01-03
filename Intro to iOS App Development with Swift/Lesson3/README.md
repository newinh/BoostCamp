# View Controller and Multiple views

  View controller는 조금 특별한 종류의 클래스이다. 이름이 암시하듯 뷰를 컨트롤하고 뷰가 필요로하는 액션을 모두 관장한다! ios개발에서 이 클래스는 대부분 UIKit FrameWork에 있는 UIViewController의 하위 클래스임을 의미한다. ViewController는 특정 이벤트가 ViewContoller나 App전체에 발생하였을때 호출된다.


### Quiz
 Q : viewDidLoad 와 viewWillAppear 중 어떤 것이 먼저 호출될까?   

 A : viewDidLoad

viewDidLoad는 viewController 클래스가 메모리에 적재되었을 때 호출되고 viewWillAppear는 viewController가 view를 화면에 보여주기 직전에 호출된다.


### view Controller life cycle
![life cycle] ()


event가 발생하기 전에 will fuction이 호출되고 event 발생 후에 did function이 호출된다. 

Remember that veiw and view controller are linked. UIViewController안에 있는 모든 subclass들은 적어도 하나의 UIView와 함께가는 IBOutlet을 가지고있다.
