import UIKit

let CellId = "PlaylistCell"

class PlaylistViewController: UICollectionViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let dataSource = PlaylistDataSource()
    let client = OSCClient()
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView!.backgroundColor = UIColor.whiteColor()
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        NSLog("Boom! Sending message to Reaper")
        let message = OSCMessage(address: "/live/play", arguments: [])
        client.sendMessage(message!, to: "udp://localhost:9000")
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }

    // MARK: Init & dealloc
    
    override init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        collectionView!.registerClass(PlaylistCell.self, forCellWithReuseIdentifier: CellId)
        collectionView!.dataSource = dataSource
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
