# AutoLayout and Buttons
 Reference : Apple Deloper

- AutoLayout
- IBOutlet & IBAction
![IBOutlet & IBAction] ()

#### Understanding AutoLayout
> Auto Layout dynamically calculates the size and position of all the views in your view hierarchy, based on constraints placed on those views. For example, you can constrain a button so that it is horizontally centered with an Image view and so that the button’s top edge always remains 8 points below the image’s bottom. If the image view’s size or position changes, the button’s position automatically adjusts to match. 

> This constraint-based approach to design allows you to build user interfaces that dynamically respond to both internal and external changes. 

### Anatomy of a Constraint

> The layout of your view hierarchy is defined as a series of linear equations. Each constraint represents a single equation. Your goal is to declare a series of equations that has one and only one possible solution.

> A sample equation is shown below.

Constrain를 적용하여 각 뷰들의 위치를 고정한다..!

![sample equation] (https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/AutolayoutPG/Art/view_formula_2x.png)

#### AutoLayout Attribute 

> In Auto Layout, the attributes define a feature that can be constrained. In general, this includes the four edges (leading, trailing, top, and bottom), as well as the height, width, and vertical and horizontal centers. Text items also have one or more baseline attributes. 

![AutoLayout Attribute] (https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/AutolayoutPG/Art/attributes_2x.png)

항상 Leading이 왼쪽, Trailing 이 오른쪽인 것은 아니다.

오른쪽에서 왼쪽으로 글을 읽는 문자를 쓸 경우 Leading이 오른쪽이다! Apple에서는 Left, Right 보다는 Leading, Trailing으로 쓸것을 권한다.


    SAMPLE EQUATION

    // Setting a constant height
    View.height = 0.0 * NotAnAttribute + 40.0

    // Setting a fixed distance between two buttons
    Button_2.leading = 1.0 * Button_1.trailing + 8.0

    // Aligning the leading edge of two buttons
    Button_1.leading = 1.0 * Button_2.leading + 0.0

    // Give two buttons the same width
    Button_1.width = 1.0 * Button_2.width + 0.0

    // Center a view in its superview
    View.centerX = 1.0 * Superview.centerX + 0.0
    View.centerY = 1.0 * Superview.centerY + 0.0

    // Give a view a constant aspect ratio
    View.height = 2.0 * View.width + 0.0

**등호뿐아니라 부등호도 가능!**


#### Intrinsic Content Size

> So far, all of the examples have used constraints to define both the view’s position and its size. However, some views have a natural size given their current content. This is referred to as their intrinsic content size. For example, a button’s intrinsic content size is the size of its title plus a small margin.

> Not all views have an intrinsic content size. For views that do, the intrinsic content size can define the view’s height, its width, or both. Some examples are listed in Table 3-1.

Table 3-1

View | Intrinsic content size
UIView and NSView | No intrinsic content size.
Sliders | Defines only the width (iOS). Defines the width, the height, or both—depending on the slider’s type (OS X).
Labels, buttons, switches, and text fields | Defines both the height and the width.
Text views and image views | Intrinsic content size can vary.


#### Hugging & Compression

> Auto Layout represents a view’s intrinsic content size using a pair of constraints for each dimension. The content hugging pulls the view inward so that it fits snugly around the content. The compression resistance pushes the view outward so that it does not clip the content.

![Content-Resistance and Content Hugging](https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/AutolayoutPG/Art/intrinsic_content_size_2x.png)

    EQUATIONS

    // Compression Resistance
    View.height >= 0.0 * NotAnAttribute + IntrinsicHeight
    View.width >= 0.0 * NotAnAttribute + IntrinsicWidth

    // Content Hugging
    View.height <= 0.0 * NotAnAttribute + IntrinsicHeight
    View.width <= 0.0 * NotAnAttribute + IntrinsicWidth

이 constraints 들은 각자 우선순위가 정해져있는데(1 ~ 1000) content-compression 이 더 쎈듯


### Working with Constraints in Interface Builder 
 Constraint 적용해보기 [링크](https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/AutolayoutPG/WorkingwithConstraintsinInterfaceBuidler.html#//apple_ref/doc/uid/TP40010853-CH10-SW1)


#### Rules of Thumb

 왠만하면 stack view라는 것을 사용하래. stack view가 적용되는 않는 경우에만 constraint를 적용하면 좋을거라네.
