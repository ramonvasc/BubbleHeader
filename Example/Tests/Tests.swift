// https://github.com/Quick/Quick

import FBSnapshotTestCase
@testable import BubbleHeader_Example

class FBSnapshotMenuTests: FBSnapshotTestCase {

    override func setUp() {
        super.setUp()
        self.recordMode = false
    }

    func testMainView() {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BaseViewController")
        FBSnapshotVerifyView(viewController.view)
    }

}
