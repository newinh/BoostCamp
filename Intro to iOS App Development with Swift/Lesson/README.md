# AutoLayout and Buttons
 Reference : Apple Deloper

### Understanding AutoLayout
> Auto Layout dynamically calculates the size and position of all the views in your view hierarchy, based on constraints placed on those views. For example, you can constrain a button so that it is horizontally centered with an Image view and so that the button’s top edge always remains 8 points below the image’s bottom. If the image view’s size or position changes, the button’s position automatically adjusts to match. 

> This constraint-based approach to design allows you to build user interfaces that dynamically respond to both internal and external changes. 

#### Anatomy of a Constraint

> The layout of your view hierarchy is defined as a series of linear equations. Each constraint represents a single equation. Your goal is to declare a series of equations that has one and only one possible solution.

A sample equation is shown below.

![sample equation] (https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/AutolayoutPG/Art/view_formula_2x.png)








