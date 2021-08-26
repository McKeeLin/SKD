//
//  ViewController.swift
//  SKD
//
//  Created by McKee on 2021/8/9.
//

import UIKit
import IntentsUI
//import SKDKit
import os.log

class ViewController: UIViewController {
    
    private var addShortcutBtn: INUIAddVoiceShortcutButton! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        os_log("SKD_LOG viewDidLoad hello")
        
        var indent: ClockInIntent?
        indent=ClockInIntent()
        
        addShortcutBtn=INUIAddVoiceShortcutButton(style: .automatic)
        addShortcutBtn.shortcut=INShortcut(intent: indent!)
        addShortcutBtn.delegate=self
        addShortcutBtn.frame.origin.x=50
        addShortcutBtn.frame.origin.y=100
        addShortcutBtn.frame.size.width=200
        addShortcutBtn.frame.size.height=36
        view.addSubview(addShortcutBtn)
    }
    
    func log(msg: String?){
        let file=#file
        let fun=#function
        //let line=#line
        guard let msg=msg as String? else {
            print(file+"\r\n"+fun)
            return
        }
        //print(file + "\r\n" + fun + "\r\n" + msg)
        os_log("%s",msg)
    }


}

extension ViewController: INUIAddVoiceShortcutButtonDelegate {
    func present(_ addVoiceShortcutViewController: INUIAddVoiceShortcutViewController, for addVoiceShortcutButton: INUIAddVoiceShortcutButton) {
        log(msg: nil)
        addVoiceShortcutViewController.delegate=self
        present(addVoiceShortcutViewController, animated: true, completion: nil)
    }
    
    func present(_ editVoiceShortcutViewController: INUIEditVoiceShortcutViewController, for addVoiceShortcutButton: INUIAddVoiceShortcutButton) {
        log(msg: nil)
        editVoiceShortcutViewController.delegate=self
        present(editVoiceShortcutViewController, animated: true, completion: nil)
    }
}

extension ViewController: INUIAddVoiceShortcutViewControllerDelegate {
    func addVoiceShortcutViewController(_ controller: INUIAddVoiceShortcutViewController, didFinishWith voiceShortcut: INVoiceShortcut?, error: Error?) {
        log(msg: nil)
        if let error = error as NSError? {
            Logger().debug("error add vioce shortcut:\(error)")
        }
        controller.dismiss(animated: true, completion: nil)
    }
    
    func addVoiceShortcutViewControllerDidCancel(_ controller: INUIAddVoiceShortcutViewController) {
        log(msg: nil)
        controller.dismiss(animated: true, completion: nil)
    }
}


extension ViewController: INUIEditVoiceShortcutViewControllerDelegate {
    func editVoiceShortcutViewControllerDidCancel(_ controller: INUIEditVoiceShortcutViewController) {
        log(msg: nil)
        controller.dismiss(animated: true, completion: nil)
    }
    
    func editVoiceShortcutViewController(_ controller: INUIEditVoiceShortcutViewController, didUpdate voiceShortcut: INVoiceShortcut?, error: Error?) {
        log(msg: nil)
        controller.dismiss(animated: true, completion: nil)
    }
    
    func editVoiceShortcutViewController(_ controller: INUIEditVoiceShortcutViewController, didDeleteVoiceShortcutWithIdentifier deletedVoiceShortcutIdentifier: UUID) {
        log(msg: nil)
        controller.dismiss(animated: true, completion: nil)
    }
}

/*
 2021-08-10 11:42:18.032951+0800 SKD[2706:79812] [NSExtension] Extension request contains input items but the extension point does not specify a set of allowed payload classes. The extension point's NSExtensionContext subclass must implement `+_allowedItemPayloadClasses`. This must return the set of allowed NSExtnsionItem payload classes. In future, this request will fail with an error. Extension: <EXConcreteExtension: 0x600003b40000> {id = com.apple.WorkflowUI.AddShortcutExtension} Items: (
     "<NSExtensionItem: 0x600000c4c210> - userInfo: {\n    INUIVoiceShortcutExtensionItemBundleURL = \"file:///Users/mckee/Library/Developer/CoreSimulator/Devices/5CB7B37C-3E85-48EF-AF74-1AA395894B3E/data/Containers/Bundle/Application/4A2EEE95-1EAB-40A2-908F-F7D16473F360/SKD.app/\";\n    INUIVoiceShortcutExtensionItemSandboxExtensionData = {length = 341, bytes = 0x64353662 39346131 35383035 61343835 ... 736b642e 61707000 };\n}"
 )
 */
