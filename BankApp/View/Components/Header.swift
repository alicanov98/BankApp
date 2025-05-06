//
//  Header.swift
//  BankApp
//
//  Created by Malik Alijanov on 29.04.25.
//

import SwiftUI

struct Header: View {
    var title: String?
    var leftIcon:Bool?
    var rightIcon:Bool?
    var onLeftTap: (() -> Void)?
     var onRightTap: (() -> Void)?
    var rightIconStr:String?
    var rightIconName:String?
    var body: some View {
        HStack {
            if leftIcon==true{
                Button {
                    onLeftTap?()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.black)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.2))
                        .clipShape(Circle())
                }
            } else {
                Button {
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.black)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.2))
                        .clipShape(Circle())
                }.opacity(0)
            }
            Spacer()
            
            if let title = title {
                Text(title)
                    .font(.title2)
            }
            
            Spacer()
            if rightIcon == true {
                Button {
                    onRightTap?()
                } label: {
                    if let rightIconName = rightIconName {
                        Image(rightIconName)
                            .frame(width: 40, height: 40)
                            .background(Color.gray.opacity(0.2))
                            .clipShape(Circle())
                    } else {
                        Image(systemName: rightIconStr ?? "magnifyingglass")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .background(Color.gray.opacity(0.2))
                            .clipShape(Circle())
                    }
                }
            }
            
        }

    }
}


#Preview {
    Header(title: "Title",leftIcon: true,rightIcon: true)
}
