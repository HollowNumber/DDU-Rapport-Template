# DDU Report Template

This template was made for quick setting up of `DDU` reports




## How to use `appendix_adder.py`

To add new figures and code sources to `appendix.typ` procedurally you must follow these simple steps:

Go into `src/images/appendix` and add a sub folder, this folder's name will become the **header**, next add the image, or source code file.

>[!NOTE]
> It's important to note that for source code, the *file name* becomes a **subheader** for the given **header**, so if you have a folder called "Menu kode" and a file called "menu.cs" it will format as: 
> ```typ
> = Menu kode
>
> == Menu
> // menu code
> ```
