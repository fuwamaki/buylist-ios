//
//  UIColor.swift
//  BuyList
//
//  Created by 牧宥作 on 2018/05/27.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import UIKit
import Foundation

// color style variable
var colorStyle: UIUserInterfaceStyle {
    return UITraitCollection.current.userInterfaceStyle
}

extension UIColor {

    convenience init(hex: String, alpha: CGFloat) {
        let v = Int("000000" + hex, radix: 16) ?? 0
        let r = CGFloat(v / Int(powf(256, 2)) % 256) / 255
        let g = CGFloat(v / Int(powf(256, 1)) % 256) / 255
        let b = CGFloat(v / Int(powf(256, 0)) % 256) / 255
        self.init(red: r, green: g, blue: b, alpha: min(max(alpha, 0), 1))
    }

    convenience init(hex: String) {
        self.init(hex: hex, alpha: 1.0)
    }

    struct Background {
        static var primary: UIColor {
            switch colorStyle {
            case .dark:
                return UIColor(hex: "#212121")
            default:
                return UIColor(hex: "#fefefe")
            }
        }

        static var secondary: UIColor {
            switch colorStyle {
            case .dark:
                return UIColor(hex: "#1f1f1f")
            default:
                return UIColor(hex: "#f5f5f5")
            }
        }

        static var tertiary: UIColor {
            switch colorStyle {
            case .dark:
                return UIColor(hex: "#464646")
            default:
                return UIColor(hex: "#c8c8c8")
            }
        }

        static var quaternary: UIColor {
            switch colorStyle {
            case .dark:
                return UIColor(hex: "#585858")
            default:
                return UIColor(hex: "#b7b7b7")
            }
        }
    }

    struct Text {
        static var primary: UIColor {
            switch colorStyle {
            case .dark:
                return UIColor(hex: "#fefefe")
            default:
                return UIColor(hex: "#212121")
            }
        }

        static var secondary: UIColor {
            switch colorStyle {
            case .dark:
                return UIColor(hex: "#dedede")
            default:
                return UIColor(hex: "#757575")
            }
        }

        static var gray: UIColor {
            return UIColor(hex: "#b7b7b7")
        }

        static var reverse: UIColor {
            switch colorStyle {
            case .dark:
                return UIColor(hex: "#212121")
            default:
                return UIColor(hex: "#fefefe")
            }
        }
    }
}
