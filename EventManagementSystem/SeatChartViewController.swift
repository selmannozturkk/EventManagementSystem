//
//  SeatChartViewController.swift
//  EventManagementSystem
//
//  Created by Selman  on 22.12.2023.
//

import UIKit

class SeatChartViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var seats: [Bool] = []
    private var reuseidentifier: String = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "SeatCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseidentifier)
    }
    @IBAction func yerEkleTapped(_ sender: UIButton) {
        seats.append(true)
        collectionView.reloadData()
    }
    @IBAction func yerSilTapped(_ sender: UIButton) {
        if !seats.isEmpty {
            let poppped = seats.popLast()
        }
        collectionView.reloadData()
    }
}

extension SeatChartViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return seats.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseidentifier, for: indexPath) as! SeatCollectionViewCell
        cell.backgroundColor = .orange
        cell.seatNumber = indexPath.row
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath) as! SeatCollectionViewCell
//        
//        let isSelected = cell.tag == 1
//        cell.backgroundColor = isSelected ? .orange : .red
//        cell.tag = isSelected ? 0 : 1
//    }
}
