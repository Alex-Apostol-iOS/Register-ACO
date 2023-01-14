//
//  RegisterACOTests.swift
//  RegisterACOTests
//
//  Created by Apostol, Alexandru on 14/1/23.
//

import XCTest
@testable import RegisterACO

final class RegisterACOTests: XCTestCase {
    
    var sut: HabitListPresenter!
    var mockView: HabitListViewProtocolMock!
    var mockInteractor: HabitListInteractorProtocolMock!
    

    override func setUpWithError() throws {
        mockView = HabitListViewProtocolMock()
        mockInteractor = HabitListInteractorProtocolMock()
        sut = HabitListPresenter(interactor: mockInteractor, coordinnatorOutput: {_ in})
        sut.view = mockView
    }

    override func tearDownWithError() throws {
        sut = nil
        mockView = nil
        mockInteractor = nil
    }

    func test_viewDidLoad_whenInvocked_willCallGetHabits() throws {
        sut.viewDidLoad()
       XCTAssertTrue(mockInteractor.getHabitsCompletionCalled)
    }
    
    func test_viewDidLoad_whenInvocked_withErrorResult_viewErrorMessageIsInvocked() throws {
        sut.viewDidLoad()
        let completion = mockInteractor.getHabitsCompletionReceivedInvocations.first
        completion?(.failure(MockError.anyError))
        XCTAssertTrue(mockView.showGenericErrorToastMessageCalled)
    }
    
    func test_viewDidLoad_whenInvocked_withSuccesResult_viewLayoutIsCalled() throws {
        sut.viewDidLoad()
        let completion = mockInteractor.getHabitsCompletionReceivedInvocations.first
        completion?(.success([]))
        XCTAssertTrue(mockView.layoutWithCalled)
       
    }
}
