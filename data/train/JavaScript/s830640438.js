process.stdin.resume();
process.stdin.setEncoding('utf8');
// Your code here!


const figureNames = ['A', 'B', 'C', 'D', 'E', 'F', 'G']

// 左上にブロックがあるとき、そのブロックから見た他のブロックの位置 ['右', '下']
const figureIndices = [
    [[1,0], [0, 1], [1, 1]],
    [[0, 1], [0, 2], [0, 3]],
    [[1, 0], [2, 0], [3, 0]],
    [[-1, 1], [0, 1], [-1, 2]],
    [[1, 0], [1, 1], [2, 1]],
    [[0, 1], [1, 1], [1, 2]],
    [[1,0], [-1, 1], [0, 1]]
]

function distinguishFigure(plane){

    const rows = plane.split('\n')
    
    for(let i = 0, l = rows.length; i < l; i++){
        
        for(let j = 0, m = rows[i].length; j < m; j++){
            
            // 図形の左上になるブロックを見つけた
            if(rows[i][j] === '1'){
                
              for(let k = 0, n = figureIndices.length; k < n; k++){
                   
                  let figureIndex = figureIndices[k]
                   
                  let isFound = true
                   
                  for(let index of figureIndex){
                       
                        let right = index[0]
                        let down = index[1]
                        
                        if(
                            !( (j + right) < m && (j + right) >= 0 && (i + down) < l ) || // 境界条件
                            rows[i+down][j+right] === '0'
                        ){
                            isFound = false
                            break
                        }
                        
                       
                  }
                   
                  if(isFound)
                        return figureNames[k]
                   
              }
                
            }
            
        }
        
    }

}

const fs = require('fs')
const length = fs.fstatSync(process.stdin.fd).size
const buffer = Buffer.alloc(length)
const bytesRead = fs.readSync(process.stdin.fd, buffer, 0, length, 0)
const input = buffer.toString('utf8', 0, bytesRead)

let result = ''

for(let plane of input.split('\n\n')){
    
    result += `${distinguishFigure(plane)}\n`

}

console.log(result.slice(0, -1))









