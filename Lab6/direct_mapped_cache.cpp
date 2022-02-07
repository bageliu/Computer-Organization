#include "direct_mapped_cache.h"
#include "string"
#include <math.h>

using namespace std;

struct cache_mark{
    bool flag;
    int tag;
};

float direct_mapped(std::string filename, int block_size, int cache_size)
{
    int total_num = -1;
    int hit_num = 0;
    int address, index_mark, tag;

    /*write your code HERE*/
    int offset = (int)log2(block_size);
    int index = (int)log2(cache_size/block_size);
    int block_number = cache_size >> offset;

    cache_mark* cache = new cache_mark[block_number];
    for(int i = 0; i < block_number; i++)
        cache[i].flag = false;

    FILE *fp = fopen((filename).c_str(), "r");
    if(!fp)
        cout << "error" << endl;
    else{
        while(fscanf(fp, "%x", &address) != EOF){
            total_num++;
            index_mark = (address >> offset) & (block_number - 1);
            tag = address >> (index + offset);

            if(cache[index_mark].flag && cache[index_mark].tag == tag){
                hit_num++;
            }
            else{
                cache[index_mark].flag = true;
                cache[index_mark].tag = tag;
            }
        }
    }
    fclose(fp);

    return (float)hit_num/(total_num + 1);
}
