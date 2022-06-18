# Navigation

Esse projeto busca mostrar como funciona a navegação entre views usando ViewCode e Storyboard. 

## Problemas de navegação enfrentados ao trabalhar com Storyboard.

 - Quando comecei a trabalhar com Storyboard eu fazia todas as minhas views dentro do mesmo arquivo e criava suas respectivas conexões. Tive muita dúvida de como chamar uma view de uma StoryBoard-B através de uma view de uma StoryBoard-A.

- Quais funções eu deveria utilizar para transitar entre as views.

## Navegue de uma view de um Storyboard-A para outra view de outro Storyboard-B.

 - Você deve começar criando a StoryBoard - B e sua respectiva view controller. 

- Imagem da scene 1 

```swift
class Scene1Controller: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
```

- Após isso você precisa criar duas referências na view que está dentro da Storyboard - B: a primeira é a controller; a segunda é criar um ID.

- Imagem das referencias

- Agora instancie um UiStoryBoard 


Explicação

```swift
let storyboard = UIStoryboard(name: "Scene1", bundle: nil)
let secondVC = storyboard.instantiateViewController(identifier:"Scene1") as! Scene1Controller
```








## Tipos de Navegação e seus respectivos encerramentos

### Present

```swift
@IBAction func buttonScene1(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Scene1", bundle: nil)
    let secondVC = storyboard.instantiateViewController(identifier:"Scene1") as! Scene1Controller
    self.present(secondVC, animated: true)
}
```

### NavigationController?.popViewController

```swift
@IBAction func buttonScene2(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Scene3", bundle: nil)
    let secondVC = storyboard.instantiateViewController(identifier:"Scene3") as! Scene3Controller
    self.navigationController?.pushViewController(secondVC, animated: true)
    //self.navigationController?.popViewController(animated: true)
}
```

### Show
```swift
@IBAction func buttonScene3(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Scene2", bundle: nil)
    let secondVC = storyboard.instantiateViewController(identifier:"Scene2") as! Scene2Controller
    self.show(secondVC, sender: true)
}
```



## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
