#include "set_associative_cache.h"
#include "string"
#include <math.h>
#include <vector>
#include <list>
#include <algorithm>
using namespace std;

float set_associative(string filename, int way, int block_size, int cache_size)
{
    int total_num = -1;
    int hit_num = 0;

    /*write your code HERE*/
    int counts = cache_size/block_size/way;
    int address, index_mark, tag;
    int offset = (int)log2(block_size);
    int index = (int)log2(cache_size/block_size/way);

    vector< list<int> > cache(counts);

    FILE *fp = fopen(filename.c_str(), "r");
    if(!fp)
        cout << "error" << endl;
    else{
        while(fscanf(fp, "%x", &address) != EOF){
            index_mark = (address >> offset) & (counts - 1);
            tag = address >> (index + offset);

            list<int>::iterator iter = find(cache[index_mark].begin(), cache[index_mark].end(), tag);
            total_num++;

            if(iter != cache[index_mark].end()){
                hit_num++;
                cache[index_mark].remove(tag);
                cache[index_mark].push_back(tag);
            }
            else{
                if(cache[index_mark].size() == way){
                    cache[index_mark].pop_front();
                }
                cache[index_mark].push_back(tag);
            }
        }
    }
    fclose(fp);

    return (float)hit_num/(total_num+1);
}
