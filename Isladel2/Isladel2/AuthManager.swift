//
//  AuthManager.swift
//  Isladel2
//
//  Created by Josephine Bates on 4/6/25.
//

import Foundation
import AuthenticationServices
import CryptoKit

class AuthManager: NSObject, ObservableObject {
    @Published var user: MockUser? = nil
    private var currentNonce: String?

    static let shared = AuthManager()

    override init() {
        super.init()
        checkUserStatus()
    }

    func checkUserStatus() {
        // Simulated login for development (bypass)
        user = MockUser(email: "test@isladel.dev", uid: UUID().uuidString)
    }

    func signOut() {
        user = nil
    }

    func signInWithApple() {
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.fullName, .email]

        let nonce = randomNonceString()
        currentNonce = nonce
        request.nonce = sha256(nonce)

        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.performRequests()
    }

    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: [Character] =
            Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remainingLength = length

        while remainingLength > 0 {
            let randoms: [UInt8] = (0 ..< 16).map { _ in
                var random: UInt8 = 0
                _ = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                return random
            }

            randoms.forEach { random in
                if remainingLength == 0 {
                    return
                }

                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }

        return result
    }

    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        return hashedData.compactMap { String(format: "%02x", $0) }.joined()
    }
}

extension AuthManager: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let _ = authorization.credential as? ASAuthorizationAppleIDCredential else { return }

        // Simulate login result
        user = MockUser(email: "appleuser@isladel.dev", uid: UUID().uuidString)
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Sign in with Apple failed: \(error.localizedDescription)")
    }
}
