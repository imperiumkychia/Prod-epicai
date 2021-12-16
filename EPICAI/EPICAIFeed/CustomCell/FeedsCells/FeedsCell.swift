//
//  AppDelegate.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import UIKit
import SnapKit
import FSPagerView

protocol FeedsCellDelegate: AnyObject {
    func feedsCell(_ cell: FeedsCell,
                   pagerView: FSPagerView,
                   pageControl: FSPageControl,
                   didGoToPageWithIndex index: Int)
}

class FeedsCell: UITableViewCell {

    @IBOutlet private weak var userImageView: UIImageView!
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var userDetailLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private weak var cellDividerView: UIView!
    @IBOutlet private weak var pageViewContainer: UIView!
    
    //Botton view
    @IBOutlet private weak var likeCountLbl: UILabel!
    @IBOutlet private weak var commentCountLbl: UILabel!
    @IBOutlet private weak var bottomActionView:UIView!
    @IBOutlet private weak var likeButton:UIButton!
    @IBOutlet private weak var commnetBtn:UIButton!
    @IBOutlet private weak var reportBtn:UIButton!
    
    var likePost:((EPICAIFeedItem) -> Void)!
    var displayAllCommnets:((EPICAIFeedItem,_ indexPath:IndexPath) -> Void)!
    var reportInappropriateContent:((EPICAIFeedItem) -> Void)!
    
    weak var delegate: FeedsCellDelegate?
    
    private var pageControl: FSPageControl!
    private var pagerView: FSPagerView!
    
    private let numberOfPages: Int = 5
        
    private var dateFormatter = DateFormatter()
    private let targetDateFormat = "dd/MM/yyyy"
    private let originalDateFormat = "yyyy-MM-dd HH:mm:ss"
    
    /// This valiable is used to track the scroll position on the pagerView, to avoid applying the scroll status to wrong cells in Feeds table
    /// the delegate func didGoToPageWithIndex is used to send back the last scroll position to the Feeds table view.
    var lastPagerViewIndex: Int = 0 {
        didSet {
            DispatchQueue.main.async {
                self.pagerView.reloadData()
                self.pagerView.scrollToItem(at: self.lastPagerViewIndex, animated: false)
                self.pageControl.currentPage = self.lastPagerViewIndex
            }
        }
    }
    
    var item: EPICAIFeedItem? {
        didSet {
            updateValues()
        }
    }
    
    private var videoURL: URL? {
        didSet {
            DispatchQueue.main.async {
                self.pagerView.reloadData()
            }
        }
    }
    
    var needsDownloadingVideo: Bool = true
    
    var gaugeData: Double = 0.0
    var tonalityData = [Double]()
    var pieChartData = [Double]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupElements()
    }

    @IBAction func hitLikeButton(_ sender: Any) {
        self.likePost(self.item!)
    }
    
    @IBAction func displayComments(_ sender: Any) {
        self.displayAllCommnets(self.item!, self.indexPath)
    }
    
    @IBAction func reportContent(_ sender: Any) {
        self.reportInappropriateContent(self.item!)
    }
    
    private func updateValues() {
        guard let item = self.item else { return }
        print("Video items \(item)")
        userImageView.image = item.userImage ?? #imageLiteral(resourceName: "noProfileImage")
        userNameLabel.text = "\(item.user.firstName) \(item.user.lastName)"
        userDetailLabel.text = item.video.videoName
        dateLabel.text = formattedDateString(string: item.video.dataTime)
        commentCountLbl.text  = String(item.video.commentsCount)
        print("Like count \(String(item.video.likeCount))")
        likeCountLbl.text = String(item.video.likeCount)
        videoURL = item.videoLocalURL
    }
    
    private func setupElements() {
        selectionStyle = .none
        self.backgroundColor = Palette.V2.V2_VCBackground
        self.contentView.backgroundColor = self.backgroundColor
        
        userImageView.layer.cornerRadius = userImageView.bounds.height / 2.0
        
        userNameLabel.font = LatoFont.bold.withSize(18.0)
        userNameLabel.textColor = Palette.V2.V2_VCTitle
        
        userDetailLabel.font = LatoFont.regular.withSize(13.0)
        userDetailLabel.textColor = Palette.V2.V2_VCTitle
        
        dateLabel.font = LatoFont.regular.withSize(12.0)
        dateLabel.textColor = Palette.V2.V2_feedsDate
        
        scoreLabel.font = LatoFont.bold.withSize(13.0)
        scoreLabel.textColor = Palette.V2.V2_pageControlIndicatorSelected
        
        cellDividerView.backgroundColor = Palette.V2.V2_pageControlIndicatorUnselected
        cellDividerView.layer.cornerRadius = cellDividerView.bounds.height / 2.0
        
        pageViewContainer.backgroundColor = self.backgroundColor
        pageViewContainer.layer.cornerRadius = 25.0
        pageViewContainer.layer.cornerCurve = .continuous
        
        pagerView = FSPagerView(frame: .zero)
        pagerView.delegate = self
        pagerView.dataSource = self
        
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "GenericPageCell")
        pagerView.register(FeedsVideoPageCell.self, forCellWithReuseIdentifier: "FeedsVideoPageCell")
        pagerView.register(FeedsPieChartCell.self, forCellWithReuseIdentifier: "FeedsPieChartCell")
        pagerView.register(FeedsGauseCell.self, forCellWithReuseIdentifier: "FeedsGauseCell")
        pagerView.register(FeedsTonalityCell.self, forCellWithReuseIdentifier: "FeedsTonalityCell")
        pagerView.register(FeedsFillerWordsCell.self, forCellWithReuseIdentifier: "FeedsFillerWordsCell")


        pagerView.layer.cornerRadius = 25.0
        pagerView.layer.cornerCurve = .continuous
        pagerView.backgroundColor = pageViewContainer.backgroundColor
        pagerView.clipsToBounds = true
        pagerView.transformer = CustomPagerViewTransformer() //FSPagerViewTransformer(type: .zoomOut)
        pagerView.isInfinite = true
        
        
        pageViewContainer.addSubview(pagerView)
        pagerView.snp.makeConstraints { (make) in
            make.leading.equalTo(pageViewContainer)
            make.trailing.equalTo(pageViewContainer)
            make.top.equalTo(pageViewContainer)
            make.bottom.equalTo(pageViewContainer).offset(-30.0)
        }
        
        pageControl = FSPageControl(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 20.0))
        pageControl.numberOfPages = numberOfPages
        pageControl.contentHorizontalAlignment = .left
        pageControl.setFillColor(Palette.V2.V2_pageControlIndicatorUnselected, for: .normal)
        pageControl.setFillColor(Palette.V2.V2_pageControlIndicatorSelected, for: .selected)
        pageControl.setPath(UIBezierPath(arcCenter: CGPoint(x: 0.0, y: pageControl.bounds.midY - 3.0), radius: 5.0, startAngle: 0.0, endAngle: 2 * .pi, clockwise: true), for: .selected)
        pageControl.setPath(UIBezierPath(arcCenter: CGPoint(x: 0.0, y: pageControl.bounds.midY - 3.0), radius: 3.0, startAngle: 0.0, endAngle: 2 * .pi, clockwise: true), for: .normal)
        pageControl.itemSpacing = 7.0
        pageControl.contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        
        pageViewContainer.addSubview(pageControl)
        pageControl.snp.makeConstraints { (make) in
            make.centerX.equalTo(pageViewContainer.center.x-40)
            //make.leading.equalTo(userImageView)
            //make.trailing.equalTo(pageViewContainer)
            make.bottom.equalTo(pageViewContainer)
            make.height.equalTo(20.0)
            make.width.equalTo(10)
        }
        
        self.likeButton.setTitle("", for: .normal)
        self.reportBtn.setTitle("", for: .normal)
        self.commnetBtn.setTitle("", for: .normal)
        self.likeButton.setImage(UIImage(named: "like")?.resized(toWidth: 30), for: .normal)
        self.reportBtn.setImage(UIImage(named: "reportContent")?.resized(toWidth: 25)?.withTintColor(.lightGray), for: .normal)
        self.commnetBtn.setImage(UIImage(named: "comment")?.resized(toWidth: 30)?.withTintColor(.lightGray), for: .normal)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        videoURL = nil
    }
    
    
    func formattedDateString(string: String?) -> String? {
        dateFormatter.dateFormat = originalDateFormat
        guard let string = string, let date = dateFormatter.date(from: string) else { return nil }
        dateFormatter.dateFormat = targetDateFormat
        return dateFormatter.string(from: date)
    }
}

extension FeedsCell: FSPagerViewDelegate, FSPagerViewDataSource {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return numberOfPages
    }
    
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        
        switch index {
        
        // Video
        case 0:
            guard let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "FeedsVideoPageCell", at: index) as? FeedsVideoPageCell else { return FSPagerViewCell() }
            
            //cell.videoURL =  URL(fileURLWithPath: Bundle.main.path(forResource: "SampleVideo_720x480_1mb", ofType: "mp4")!)
            /*
            if let url = self.videoURL {
                cell.videoURL = url
            }
            */
            cell.videoURL = self.videoURL
            
            return cell
            
        // Pie chart
        case 1:
            guard let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "FeedsPieChartCell", at: index) as? FeedsPieChartCell else { return FSPagerViewCell() }
            
            cell.categories = [(title: "Hand in pocket",
                                color: Palette.V2.V2_pieChartRed,
                                percentage: pieChartData[0]),
                               (title: "Touch chin",
                                color: Palette.V2.V2_pieChartYellow,
                                percentage: pieChartData[1]),
                               (title: "Cross arm",
                                color: Palette.V2.V2_pieChartBlue,
                                percentage: pieChartData[2]),
                               (title: "Normal",
                                color: Palette.V2.V2_pieChartGreen,
                                percentage: pieChartData[3])]
            
            return cell
            
        // Gauge view
        case 2:
            guard let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "FeedsGauseCell", at: index) as? FeedsGauseCell else { return FSPagerViewCell() }
            
            cell.value = gaugeData
            
            return cell
            
        // Tonality chart
        case 3:
            guard let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "FeedsTonalityCell", at: index) as? FeedsTonalityCell else { return FSPagerViewCell() }
            
            cell.data = tonalityData
            
            return cell
            
        // Filler words
        case 4:
            guard let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "FeedsFillerWordsCell", at: index) as? FeedsFillerWordsCell else { return FSPagerViewCell() }
            
            cell.data = [(title: "Um", color: Palette.V2.V2_fillerWordsGrey, value: 10),
                         (title: "You Know", color: Palette.V2.V2_fillerWordsLightBlue, value: 7),
                         (title: "I Mean", color: Palette.V2.V2_fillerWordsBlue, value: 4)]
            
            return cell
            
          
            
        default:
            let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "GenericPageCell", at: index)
            return cell
        }
        
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        pageControl.currentPage = targetIndex
        delegate?.feedsCell(self, pagerView: pagerView, pageControl: pageControl, didGoToPageWithIndex: targetIndex)
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {

    }
    
}

class RandomDataGenerator {
    static func generateRandomPieChartData(numberOfCategories count: Int) -> [Double] {
        var data = [Double]()
        var idx: Int = 0
        
        if count == 0 { return data }
        if count == 1 {
            return [Double.random(in: 0.0...100.0)]
        }
        
        while idx < (count - 1) {
            data.append(Double.random(in: 0...(100.0 - data.sum())))
            idx += 1
        }
        
        data.append(100.0 - data.sum())
        
        return data
    }
    
    static func generateRandomTonalityData() -> [Double] {
        return (1...30).map( {_ in Double.random(in: 1...100)} )
    }
    
    static func generateRandomGaugeData() -> Double {
        return Double.random(in: 10...300)
    }
}


class CustomPagerViewTransformer: FSPagerViewTransformer {
        
    init() {
        super.init(type: .zoomOut)
    }
    
    override func applyTransform(to attributes: FSPagerViewLayoutAttributes) {
        
        guard let pagerView = self.pagerView else {
            return
        }
        let position = attributes.position
        let scrollDirection = pagerView.scrollDirection
        let itemSpacing = (scrollDirection == .horizontal ? attributes.bounds.width : attributes.bounds.height) + self.proposedInteritemSpacing()
        
        var alpha: CGFloat = 0
        var transform = CGAffineTransform.identity
        switch position {
        case -CGFloat.greatestFiniteMagnitude ..< -1 : // [-Infinity,-1)
            // This page is way off-screen to the left.
            alpha = 0
        case -1 ... 1 :  // [-1,1]
            // Modify the default slide transition to shrink the page as well
            let scaleFactor = max(self.minimumScale, 1 - abs(position))
            //transform.a = scaleFactor
            //transform.d = scaleFactor
            switch scrollDirection {
            case .horizontal:
                let vertMargin = attributes.bounds.height * (1 - scaleFactor) / 2;
                let horzMargin = itemSpacing * (1 - scaleFactor) / 2;
                transform.tx = position < 0 ? (horzMargin - vertMargin*2) : (-horzMargin + vertMargin*2)
            case .vertical:
                let horzMargin = attributes.bounds.width * (1 - scaleFactor) / 2;
                let vertMargin = itemSpacing * (1 - scaleFactor) / 2;
                transform.ty = position < 0 ? (vertMargin - horzMargin*2) : (-vertMargin + horzMargin*2)
            }
            // Fade the page relative to its size.
            alpha = self.minimumAlpha + (scaleFactor-self.minimumScale)/(1-self.minimumScale)*(1-self.minimumAlpha)
        case 1 ... CGFloat.greatestFiniteMagnitude :  // (1,+Infinity]
            // This page is way off-screen to the right.
            alpha = 0
        default:
            break
        }
        attributes.alpha = alpha
        attributes.transform = transform
        
    }
}
