# Playback and Effects

이번레슨에서는 *audio playback*과 *stack view*에 대해 공부한다ㅇㅇ  
Stack View 는 *Autolayout Constraints*를 간편하게 만들어줄거야.

## StackViews as a Concept

*Stack View*에 쉽게 *UIElement*들을 넣고 배치할 수 있어. 수평, 수직 지향이 있고 *Stack View*안에 *Stack View*를 넣는것도 가능해. 그리고 그 안에서 *alignment, distribution, spacing*을 조절할 수 있지!
 ![StackViews as a Concept] (./StackViews as a Concept.png)

## Inserting StackViews
 
![Inserting StackViews] (./Inserting StackViews.png)

다음은 달팽이, 토끼버튼 넣기. 알아서하자😝

## 다음도 잘 그림따라서 잘 진행해보자

![Stack View](https://d17h27t6h515a5.cloudfront.net/topher/2016/November/582a7fd2_document-outline/document-outline.png)
![Stack View](https://d17h27t6h515a5.cloudfront.net/topher/2016/November/582a8006_interface/interface.png)

## Wiring up Buttons(IBOutlets + IBActions)

이제 View의 버튼UI를 View Controller 클래스와 연결해주어야하는데 조금 더 편한 방법을 해보자

1. PlaySoundsViewController에 코드를 먼저 작성!    
![Wiring1](./Wiring1.png)

1. 다음과 같이 StoryBoard에서 Play Sounds View Controller를 `ctrl`클릭 후 각 버튼에 연결지어준다.  
![Wiring2](./Wiring2.png)

1. 이번에는 IBAction을 만들어보자. 먼저 코드를 작성하고

```swift
// Mark : Actions

@IBAction func playSoundForButton(_ sender: UIButton){
    print("Play Sound Button Pressed")
}

@IBAction func stopButtonPressed(_ sender: AnyObject){
    print("Stop Audio Button Pressed")
}
```

1. 아까와는 반대로 버튼에서 Play Sounds View Controller로 이어주자
![Wiring3](./Wiring3.png)

## Adding the Audio Extension

- Paste the following code below the button outlets in `PlaySoundsViewController`:

```swift
var recordedAudioURL:URL!
var audioFile:AVAudioFile!
var audioEngine:AVAudioEngine!
var audioPlayerNode: AVAudioPlayerNode!
var stopTimer: Timer!

enum ButtonType: Int {
    case slow = 0, fast, chipmunk, vader, echo, reverb
}
```

- 그리고 첨부된 PlaySoundsViewController+Audio.swift 파일을 우리 프로젝트에 넣자.
아직 extention에 대해 잘 모르지만 일단 오디오를 출력하는 것에 집중하다.  
- `viewDidLoad()` function에 `setupAudio()` 추가
- `viewWillLoad()` function override하고 `configureUI(.notPlaying)` 추가

## Playing Back Audio

우리가 만든 6개의 UIButton들을 구별해야 하는데 가장쉬운 방법이 *tag property*를 사용하는 것이다. Attributes inspector에서 Tag 항목을 찾을 수있다. *tag property*에 단순 `Int` 값을 줄 수 있다. 건드리지 않았다면 `0`으로 초기화 되어있다.  
0 ~ 5 를 각각 넣어주자.


playSound function과 stopPlay function을 업데이트 해주자.
```swift
@IBAction func playSoundForButton(_ sender: UIButton){

    switch(ButtonType(rawValue: sender.tag)!){

    case .slow:
        playSound()
    case .fast:
        playSound(rate: 1.5)
    case .chipmunk:
        playSound(pitch: 1000)
    case .vader:
        playSound(pitch: -1000)
    case .echo:
        playSound(echo: true)
    case .reverb:
        playSound(reverb: true)
    }

    configureUI(.playing)
}

@IBAction func stopButtonPressed(_ sender: AnyObject){
    stopAudio()
}

```



## playSoundViewController Extension

























