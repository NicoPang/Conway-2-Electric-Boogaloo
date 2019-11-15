//
//  ColonyView.swift
//  League of Legends TI84 Version
//
//  Created by Mattew Yao on 11/12/19.
//  Copyright © 2019 Senza. All rights reserved.
//

import SwiftUI

//hi
struct ColonyView: View{
    var n: Int
    var body: some View{
        GeometryReader{ geometry in
            ZStack{
                ForEach(0..<(self.n + 1)){ x in //horz lines
                    Rectangle()
                        .frame(width: geometry.size.width, height: 0.5)
                        .offset(y: self.getOffset(size: geometry.size.width, amt: x))
                }
                ForEach(0..<(self.n + 1)){ y in //vert lines
                    Rectangle()
                        .frame(width: 0.5, height: geometry.size.width)
                        .offset(x: self.getOffset(size: geometry.size.width, amt: y))
                    
                }
                /*
                ForEach(0..<(self.n + 1)){ x in
                    ForEach(0..<(self.n + 1)){ y in
                        Rectangle()
                        .frame(width: self.rectSize(size: geometry.size.width), height: self.rectSize(size: geometry.size.width))
                        .offset(x: self.getOffset(size: geometry.size.width, amt: y), y: self.getOffset(size: geometry.size.width, amt: x))
                    }
                }
                */
                
                Rectangle()
                .frame(width: self.rectSize(size: geometry.size.width), height: self.rectSize(size: geometry.size.width))
                    .offset(self.cellOffset(size: geometry.size.width, x: 40, y: 40))
 
            }
        }.drawingGroup()
    }
    func getOffset(size: CGFloat, amt: Int)-> CGFloat{
        return size / CGFloat(2) - size / CGFloat(n) * CGFloat(amt)
        
    }
    func cellOffset(size: CGFloat, x: Int, y: Int)-> CGSize{
        let step = size / CGFloat(n)
        let xZero = size / CGFloat(2 * n) - size / CGFloat (2)
        let yZero = size / CGFloat(2 * n) - size / CGFloat (2)
        //trust the math
        let xcord = xZero + CGFloat(x) * step
        let ycord = yZero + CGFloat(y) * step
        return CGSize(width: xcord, height: ycord)
    }
    
    func rectSize(size: CGFloat)->CGFloat{
        return size / CGFloat(n)
    }
}






struct ColonyView_Previews: PreviewProvider {
    static var previews: some View {
        ColonyView(n: 60)
    }
}
