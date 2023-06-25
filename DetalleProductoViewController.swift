
import UIKit

class DetalleProductoViewController: UIViewController {

    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblTITLE: UILabel!
    @IBOutlet weak var lblPRICE: UILabel!
    @IBOutlet weak var lblDESCRIPTION: UILabel!
    @IBOutlet weak var lblRATE: UILabel!
    @IBOutlet weak var lblCOUNT: UILabel!
    
    var productoID: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mostrarDetalleProducto()
    }
    
    func mostrarDetalleProducto() {
        print(productoID)
        let urlBase: String = "https://fakestoreapi.com/products/\(productoID)"
        guard let url = URL(string: urlBase) else {
            return
        }
        
        let tarea = URLSession.shared.dataTask(with: url) { datos, respuesta, error in
            if let datos = datos {
                if let producto = try? JSONDecoder().decode(Producto.self, from: datos) {
                    DispatchQueue.main.async {
                        self.lblID.text = String(producto.id)
                        self.lblTITLE.text = String(producto.title)
                        self.lblPRICE.text = String(producto.price)
                        self.lblDESCRIPTION.text = String(producto.description)
                        self.lblRATE.text = String(producto.rating.rate)
                        self.lblCOUNT.text = String(producto.rating.count)
                    }
                }
            }
        }
        tarea.resume()
    }

    @IBAction func btnVolver(_ sender: UIButton) {
        let container = UIStoryboard(name:"Main",bundle: nil)
        let pantalla = container.instantiateViewController(identifier: "principal") as! ViewController
        present(pantalla, animated: true, completion: nil)
    }
}
