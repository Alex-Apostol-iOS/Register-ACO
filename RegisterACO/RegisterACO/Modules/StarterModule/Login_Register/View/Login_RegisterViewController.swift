//
//  Login_RegisterViewController.swift
//  RegisterACO
//
//  Created by Alex Apostol on 16/4/22.
//  
//

import UIKit

class Login_RegisterViewController: RegisterAcoNavigationController {
    
    let presenter: Login_RegisterPresenterProtocol
    private let sectionInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    private var content: [StartCarrouselCollectionViewCellModel] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.collectionView.reloadData()
            }
        }
    }
    
    
    private var currentPage = 0 {
        didSet {
            self.pageController.currentPage = currentPage
        }
    }
    
    private lazy var pageController: UIPageControl = {
        let view = UIPageControl(frame: .zero)
        view.tintColor = UIColor.theme(.primary50)
        view.currentPageIndicatorTintColor = UIColor.theme(.primary100)
        view.heightAnchor.constraint(equalToConstant: 32).isActive = true
        view.pageIndicatorTintColor = UIColor.theme(.primary50)
        return view
    }()
    
    private lazy var pageControllerStackView: UIStackView = {
       let view = UIStackView(arrangedSubviews: [pageController])
        view.distribution = .fill
        view.alignment = .center
        view.axis = .horizontal
        return view
    }()
    
    private lazy var registerButton: RegisterACOButton = {
        let button = RegisterACOButton(frame: .zero)
        button.config(buttonStyle: .primary, title: presenter.getlabelForKey(key: "lng.register"), action: didTapRegisterButton)
        return button
    }()
    
    private lazy var loginButton: RegisterACOButton = {
        let button = RegisterACOButton(frame: .zero)
        button.config(buttonStyle: .secondary, title: presenter.getlabelForKey(key: "lng.login"), action: didTapLoginButton)
        return button
    }()
    
    private lazy var collectionViewLayout: UICollectionViewFlowLayout = {
        var layout = UICollectionViewFlowLayout()
        layout.sectionInset = sectionInsets
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: self.view.frame.width, height: view.frame.height * 0.6)
        return layout
    }()
    
    lazy var collectionView: ContentSizedCollectionView = {
        let collectionView = ContentSizedCollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.register(StartCarrouselCollectionViewCell.self, forCellWithReuseIdentifier: StartCarrouselCollectionViewCell.id)
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = true
        collectionView.isPagingEnabled = true
        collectionView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.6).isActive = true
        return collectionView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [FreeSpaceView(), collectionView, pageControllerStackView, buttonsStackView])
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [ registerButton, loginButton])
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
        
    init (presenter: Login_RegisterPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMainStackViewLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        presenter.viewDidLoad()
       
    }
    
    private func setUpMainStackViewLayout()  {
        view.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    }
    
    private func didTapLoginButton() {
        presenter.didTapLoginButtton()
    }
    
    private func didTapRegisterButton() {
        presenter.didTapRegisterButton()
    }
    
}

extension Login_RegisterViewController: Login_RegisterViewProtocol{
    func darwCarrousel(with data: [StartCarrouselCollectionViewCellModel]) {
        content = data
        pageController.numberOfPages = content.count
    }
}

extension Login_RegisterViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        content.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = content[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StartCarrouselCollectionViewCell.id, for: indexPath) as! StartCarrouselCollectionViewCell
        cell.configure(with: item)
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
           currentPage = getCurrentPage()
       }
       
       func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
           currentPage = getCurrentPage()
       }
       
       func scrollViewDidScroll(_ scrollView: UIScrollView) {
           currentPage = getCurrentPage()
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let frameSize = collectionView.frame.size
        return CGSize(width: frameSize.width , height: frameSize.height)
    }

}


private extension Login_RegisterViewController {
    func getCurrentPage() -> Int {
        
        let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let visibleIndexPath = collectionView.indexPathForItem(at: visiblePoint) {
            return visibleIndexPath.row
        }
        
        return currentPage
    }
}
