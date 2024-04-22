//
//  CameraView.swift
//  ClothesScannerTests
//
//  Created by Nicholas Kuo on 4/13/24.
//

import SwiftUI
import UIKit

struct CameraView: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var presentationMode

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: CameraView
        var imageHelper: ImageVisionHelper

        init(_ parent: CameraView) {
            self.parent = parent
            self.imageHelper = ImageVisionHelper()
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                if let ciImage = CIImage(image: uiImage) {
                    let processedImage = imageHelper.removeBackground(from: ciImage, croppedToInstanceExtent: true)
                    if let processedImageFinal = processedImage {
                        let processedCGImage = imageHelper.render(ciImage: processedImageFinal)
                        let finalImage = UIImage(cgImage: processedCGImage, scale: 1.0, orientation: uiImage.imageOrientation)
                        self.parent.image = finalImage
                    } else {
                        self.parent.image = nil
                    }
                }
                else {
                    print("Failed to remove background.")
                }
                
            } else {
                print("Error converting UIImage to CIImage.")
            }

            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}


import UIKit

import CoreGraphics

func createTransparentCGImage() -> CGImage? {
    let width = 100
    let height = 100
    let bitsPerComponent = 8
    let bytesPerPixel = 4
    let bytesPerRow = bytesPerPixel * width
    let colorSpace = CGColorSpaceCreateDeviceRGB()
    let bitmapInfo = CGImageAlphaInfo.premultipliedLast.rawValue | CGImageAlphaInfo.noneSkipLast.rawValue

    guard let context = CGContext(data: nil, width: width, height: height, bitsPerComponent: bitsPerComponent, bytesPerRow: bytesPerRow, space: colorSpace, bitmapInfo: bitmapInfo) else { return nil }

    // Set the background color to transparent
    context.setFillColor(UIColor.clear.cgColor)
    context.fill(CGRect(x: 0, y: 0, width: width, height: height))

    let cgImage = context.makeImage()
    return cgImage
}
