//
//  ChatDetailViewController.swift
//  PeiPei
//
//  Created by My Mac on 9/14/15.
//  Copyright (c) 2015 Swift. All rights reserved.
//

import UIKit

class ChatDetailViewController: JSQMessagesViewController, UIActionSheetDelegate{

    @IBOutlet weak var chatDetailTblView: UITableView!
    @IBOutlet weak var chatDetailTextField: UITextField!
    @IBOutlet weak var chatDetailsFooterView: UIView!
    
    @IBOutlet weak var chatDetailAttachment: UIButton!
    var messages = [Message]()
    var avatars = Dictionary<String, UIImage>()
    var outgoingBubbleImageView:UIImageView!; // JSQMessagesBubbleImageFactory.outgoingMessageBubbleImageViewWithColor(UIColor.jsq_messageBubbleLightGrayColor())
    var incomingBubbleImageView:UIImageView!; //= JSQMessagesBubbleImageFactory.incomingMessageBubbleImageViewWithColor(UIColor.jsq_messageBubbleGreenColor())

    var senderImageUrl: String!
    var batchMessages = true
    var viewBottom:UIView!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyScrollsToMostRecentMessage = true
        sender = "123256789" //(sender != nil) ? sender : "Anonymous"
        let message = Message(text: "hi", sender: "11", imageUrl: "")
        self.messages.append(message)
        let message1 = Message(text: "hi", sender: "11", imageUrl: "")
        self.messages.append(message1)
        let message2 = Message(text: "hi", sender: "123256789", imageUrl: "")
        self.messages.append(message2)
        let message3 = Message(text: "hi", sender: "11", imageUrl: "")
        self.messages.append(message3)
        let message4 = Message(text: "hisdfasdf asdfas df", sender: "11", imageUrl: "")
        self.messages.append(message4)
        self.finishReceivingMessage()
        outgoingBubbleImageView = UIImageView(image: UIImage(named: "chat_reply_img.png"));
        incomingBubbleImageView = UIImageView(image: UIImage(named: "chat_response_img.png"));
        self.inputToolbar.backgroundColor = UIColor.clearColor();
        /*
        self.collectionView.collectionViewLayout.incomingAvatarViewSize = CGSizeZero;
        self.collectionView.collectionViewLayout.outgoingAvatarViewSize = CGSizeZero;
        */
        
        self.collectionView.collectionViewLayout.incomingAvatarViewSize = CGSizeZero;
        self.collectionView.collectionViewLayout.outgoingAvatarViewSize = CGSizeZero;
        self.view.backgroundColor = UIColor.blackColor();
        self.collectionView.backgroundColor = UIColor.blackColor();
        let button   = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        button.frame = CGRectMake(0, (inputToolbar.contentView.rightBarButtonItem.frame.size.height)/2 - 10, 32, 22)
        button.backgroundColor = UIColor.clearColor()
        /*button.setImage(UIImage(named: "Attach"), forState: UIControlState.Normal)
        button.setImage(UIImage(named: "Attach"), forState: UIControlState.Highlighted)
        button.setImage(UIImage(named: "Attach"), forState: UIControlState.Selected)*/
        var imgView:UIImageView = UIImageView(frame: CGRectMake(0, 0, 22, 22))
        imgView.image = UIImage(named: "Attach")
        button.addSubview(imgView)
        button.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        button.tintColor = UIColor.grayColor()
        inputToolbar.contentView.leftBarButtonItem = nil
        inputToolbar.contentView.rightBarButtonItem = button;
        
        /*UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-1, self.frame.size.width, 1)];
        view.backgroundColor = [UIColor darkGrayColor];
        */
        
        /*
        viewBottom = UIView(frame: CGRectMake(inputToolbar.contentView.textView.frame.origin.x, inputToolbar.contentView.textView.frame.size.height + 2, inputToolbar.contentView.textView.frame.size.width, 1));
        viewBottom.backgroundColor = UIColor(red: 236, green: 236, blue: 236, alpha: 1);
        inputToolbar.addSubview(viewBottom);
        */
        
        //inputToolbar.contentView.textView.
        //inputToolbar.contentView.te = chatDetailsFooterView;
        // Do any additional setup after loading the view.
        //self.navigationController?.navigationBar.backItem!.title = "";
        self.title = "Stacy Martin"
        //navigationController?.navigationBar.topItem?.title = "Logout"
        navigationController?.navigationBar.backItem?.title = "";
        
        var rightImg:UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "chat_rightImage.png"), style: UIBarButtonItemStyle.Done, target: self, action: nil)
        navigationController?.navigationItem.rightBarButtonItem = rightImg;

        navigationItem.rightBarButtonItem = rightImg;
    }
    
    func changeBottomViewPos(){
        viewBottom.frame = CGRectMake(inputToolbar.contentView.textView.frame.origin.x, inputToolbar.contentView.textView.frame.size.height + 2, inputToolbar.contentView.textView.frame.size.width, 1);
        
    }
    
    func buttonAction(sender: UIButton!){
        println("Button tapped")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.collectionViewLayout.springinessEnabled = true
    }
    
    func senderDisplayName() -> String! {
        return "Ilan"
    }
    
    func senderId() -> String! {
        return "123256789"
    }
    
    override func didPressSendButton(button: UIButton!, withMessageText text: String!, sender: String!, date: NSDate!) {
        //JSQSystemSoundPlayer.jsq_playMessageSentSound()
        
        //let message: JSQMessage = JSQMessage(senderId: senderId, senderDisplayName: senderDisplayName, date: date, text: text)
        //        let message: JSQMessage = JSQMessage(text: "hi", sender: "123", date: NSDate());
        let message = Message(text: inputToolbar.contentView.textView.text, sender: "123256789", imageUrl: "")
        messages.append(message);
        finishSendingMessage()
    }
    
    func sendMessage(text: String!, sender: String!) {
        // *** STEP 3: ADD A MESSAGE TO FIREBASE
        
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, bubbleImageViewForItemAtIndexPath indexPath: NSIndexPath!) -> UIImageView! {
        let message = messages[indexPath.item]
        println("msg sender and current sender is same \(message.sender()) \(sender)")

        if message.sender() == sender {
        
            return UIImageView(image: outgoingBubbleImageView.image?.resizableImageWithCapInsets(UIEdgeInsetsMake(19, 18, 24, 20), resizingMode: UIImageResizingMode.Stretch), highlightedImage: outgoingBubbleImageView.image?.resizableImageWithCapInsets(UIEdgeInsetsMake(10, 10, 10, 10), resizingMode: UIImageResizingMode.Stretch))
        }
        //UIEdgeInsetsMake(<#top: CGFloat#>, <#left: CGFloat#>, <#bottom: CGFloat#>, <#right: CGFloat#>)
        return UIImageView(image: incomingBubbleImageView.image?.resizableImageWithCapInsets(UIEdgeInsetsMake(18, 22, 22, 18), resizingMode: UIImageResizingMode.Stretch), highlightedImage: incomingBubbleImageView.highlightedImage?.resizableImageWithCapInsets(UIEdgeInsetsMake(0, 100, 0, 0), resizingMode: UIImageResizingMode.Stretch))
    }
    
    func setupAvatarImage(name: String, imageUrl: String?, incoming: Bool) {
        if let stringUrl = imageUrl {
            if let url = NSURL(string: stringUrl) {
                if let data = NSData(contentsOfURL: url) {
                    let image = UIImage(data: data)
                    let diameter = incoming ? UInt(collectionView.collectionViewLayout.incomingAvatarViewSize.width) : UInt(collectionView.collectionViewLayout.outgoingAvatarViewSize.width)
                    let avatarImage = JSQMessagesAvatarFactory.avatarWithImage(image, diameter: diameter)
                    avatars[name] = avatarImage
                    return
                }
            }
        }
        
        // At some point, we failed at getting the image (probably broken URL), so default to avatarColor
        setupAvatarColor(name, incoming: incoming)
    }

    
    func setupAvatarColor(name: String, incoming: Bool) {
        let diameter = incoming ? UInt(collectionView.collectionViewLayout.incomingAvatarViewSize.width) : UInt(collectionView.collectionViewLayout.outgoingAvatarViewSize.width)
        
        let rgbValue = name.hash
        let r = CGFloat(Float((rgbValue & 0xFF0000) >> 16)/255.0)
        let g = CGFloat(Float((rgbValue & 0xFF00) >> 8)/255.0)
        let b = CGFloat(Float(rgbValue & 0xFF)/255.0)
        let color = UIColor(red: r, green: g, blue: b, alpha: 0.5)
        
        let nameLength = count(name)
        let initials : String? = name.substringToIndex(advance(sender.startIndex, min(3, nameLength)))
        let userImage = JSQMessagesAvatarFactory.avatarWithUserInitials(initials, backgroundColor: color, textColor: UIColor.blackColor(), font: UIFont.systemFontOfSize(CGFloat(13)), diameter: diameter)
        
        avatars[name] = userImage
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, messageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageData! {
        return messages[indexPath.item]
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, avatarImageViewForItemAtIndexPath indexPath: NSIndexPath!) -> UIImageView! {
        return nil;
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
   /* override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = super.collectionView(collectionView, cellForItemAtIndexPath: indexPath) as! JSQMessagesCollectionViewCell
        
        let message = messages[indexPath.item]
        if message.sender() == sender {
            cell.textView.textColor = UIColor.blackColor()
        } else {
            cell.textView.textColor = UIColor.whiteColor()
        }
        
        let attributes : [NSObject:AnyObject] = [NSForegroundColorAttributeName:cell.textView.textColor, NSUnderlineStyleAttributeName: 1]
        cell.textView.linkTextAttributes = attributes
        
        //        cell.textView.linkTextAttributes = [NSForegroundColorAttributeName: cell.textView.textColor,
        //            NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle]
        return cell
    }*/
    
    
    // View  usernames above bubbles
    override func collectionView(collectionView: JSQMessagesCollectionView!, attributedTextForMessageBubbleTopLabelAtIndexPath indexPath: NSIndexPath!) -> NSAttributedString! {
        let message = messages[indexPath.item];
        
        // Sent by me, skip
        if message.sender() == sender {
            return nil;
        }
        
        // Same as previous sender, skip
        if indexPath.item > 0 {
            let previousMessage = messages[indexPath.item - 1];
            if previousMessage.sender() == message.sender() {
                return nil;
            }
        }
        
        return NSAttributedString(string:message.sender())
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForMessageBubbleTopLabelAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        let message = messages[indexPath.item]
        
        // Sent by me, skip
        if message.sender() == sender {
            return CGFloat(0.0);
        }
        
        // Same as previous sender, skip
        if indexPath.item > 0 {
            let previousMessage = messages[indexPath.item - 1];
            if previousMessage.sender() == message.sender() {
                return CGFloat(0.0);
            }
        }
        return CGFloat(0.0);
        //return kJSQMessagesCollectionViewCellLabelHeightDefault
    }
    override func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        var size:CGSize = super.collectionView(collectionView, layout: collectionViewLayout, sizeForItemAtIndexPath: indexPath);
        return CGSizeMake(size.width, size.height+4)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func chatDetailAttachAction(sender: AnyObject) {
        
    }
    
}
