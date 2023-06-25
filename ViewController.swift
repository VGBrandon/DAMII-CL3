
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tvProductos: UITableView!
    var listProductos: [Producto] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tvProductos.dataSource = self
        tvProductos.delegate = self
        listarProductos()
    }
    
    func listarProductos() {
        let urlBase: String = "https://fakestoreapi.com/products"
        let urlConsulta = URL(string: urlBase)
        let request = URLRequest(url: urlConsulta!)
        let tarea = URLSession.shared.dataTask(with: request) { datos, respuesta, error in
            if error == nil, let datos = datos {
                if let productos = try? JSONDecoder().decode([Producto].self, from: datos) {
                    self.listProductos = productos
                    DispatchQueue.main.async {
                        self.tvProductos.reloadData()
                    }
                }
            }
        }
        tarea.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listProductos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let fila = tvProductos.dequeueReusableCell(withIdentifier: "cell") as! ItemProductoTableViewCell
        fila.lblID.text = "ID : " + String(listProductos[indexPath.row].id)
        fila.lblTITLE.text = "TITLE : " + listProductos[indexPath.row].title

        return fila
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "relacion" {
            if let detalleProductoVC = segue.destination as? DetalleProductoViewController {
                if let indexPath = tvProductos.indexPathForSelectedRow {
                    let productoSeleccionado = listProductos[indexPath.row]
                    detalleProductoVC.productoID = productoSeleccionado.id
                }
            }
        }
    }

}

