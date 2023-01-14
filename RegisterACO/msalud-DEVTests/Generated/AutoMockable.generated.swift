// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif

@testable import RegisterACO














class HabitListInteractorProtocolMock: HabitListInteractorProtocol {

    //MARK: - getHabits

    var getHabitsCompletionCallsCount = 0
    var getHabitsCompletionCalled: Bool {
        return getHabitsCompletionCallsCount > 0
    }
    var getHabitsCompletionReceivedCompletion: ((Result<[DtoPostiveHabit], Error>) -> Void)?
    var getHabitsCompletionReceivedInvocations: [((Result<[DtoPostiveHabit], Error>) -> Void)] = []
    var getHabitsCompletionClosure: ((@escaping (Result<[DtoPostiveHabit], Error>) -> Void) -> Void)?

    func getHabits(completion: @escaping (Result<[DtoPostiveHabit], Error>) -> Void) {
        getHabitsCompletionCallsCount += 1
        getHabitsCompletionReceivedCompletion = completion
        getHabitsCompletionReceivedInvocations.append(completion)
        getHabitsCompletionClosure?(completion)
    }

    //MARK: - deleteHabit

    var deleteHabitNameCompletionCallsCount = 0
    var deleteHabitNameCompletionCalled: Bool {
        return deleteHabitNameCompletionCallsCount > 0
    }
    var deleteHabitNameCompletionReceivedArguments: (name: String, completion: (Result<Bool, Error>) -> Void)?
    var deleteHabitNameCompletionReceivedInvocations: [(name: String, completion: (Result<Bool, Error>) -> Void)] = []
    var deleteHabitNameCompletionClosure: ((String, @escaping (Result<Bool, Error>) -> Void) -> Void)?

    func deleteHabit(name: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        deleteHabitNameCompletionCallsCount += 1
        deleteHabitNameCompletionReceivedArguments = (name: name, completion: completion)
        deleteHabitNameCompletionReceivedInvocations.append((name: name, completion: completion))
        deleteHabitNameCompletionClosure?(name, completion)
    }

}
class HabitListViewProtocolMock: HabitListViewProtocol {

    //MARK: - layout

    var layoutWithCallsCount = 0
    var layoutWithCalled: Bool {
        return layoutWithCallsCount > 0
    }
    var layoutWithReceivedContent: [DtoPostiveHabit]?
    var layoutWithReceivedInvocations: [[DtoPostiveHabit]] = []
    var layoutWithClosure: (([DtoPostiveHabit]) -> Void)?

    func layout(with content: [DtoPostiveHabit]) {
        layoutWithCallsCount += 1
        layoutWithReceivedContent = content
        layoutWithReceivedInvocations.append(content)
        layoutWithClosure?(content)
    }

    //MARK: - showLoader

    var showLoaderCallsCount = 0
    var showLoaderCalled: Bool {
        return showLoaderCallsCount > 0
    }
    var showLoaderClosure: (() -> Void)?

    func showLoader() {
        showLoaderCallsCount += 1
        showLoaderClosure?()
    }

    //MARK: - hideLoader

    var hideLoaderCallsCount = 0
    var hideLoaderCalled: Bool {
        return hideLoaderCallsCount > 0
    }
    var hideLoaderClosure: (() -> Void)?

    func hideLoader() {
        hideLoaderCallsCount += 1
        hideLoaderClosure?()
    }

    //MARK: - showToast

    var showToastMessageTypeCallsCount = 0
    var showToastMessageTypeCalled: Bool {
        return showToastMessageTypeCallsCount > 0
    }
    var showToastMessageTypeReceivedArguments: (message: String, type: ToastType)?
    var showToastMessageTypeReceivedInvocations: [(message: String, type: ToastType)] = []
    var showToastMessageTypeClosure: ((String, ToastType) -> Void)?

    func showToast(message: String, type: ToastType) {
        showToastMessageTypeCallsCount += 1
        showToastMessageTypeReceivedArguments = (message: message, type: type)
        showToastMessageTypeReceivedInvocations.append((message: message, type: type))
        showToastMessageTypeClosure?(message, type)
    }

    //MARK: - showGenericErrorToastMessage

    var showGenericErrorToastMessageCallsCount = 0
    var showGenericErrorToastMessageCalled: Bool {
        return showGenericErrorToastMessageCallsCount > 0
    }
    var showGenericErrorToastMessageClosure: (() -> Void)?

    func showGenericErrorToastMessage() {
        showGenericErrorToastMessageCallsCount += 1
        showGenericErrorToastMessageClosure?()
    }

}
