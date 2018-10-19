//
//  main.m
//  LessonCollection

#import <Foundation/Foundation.h>
#import "Book.h"
int main(int argc, const char * argv[]) {
/*
    //OC 中的数组存储的是对象(数组的局限性),但是对于对象的类型并没有限制,可以是NSString * 型,数组类型,字典类型....

    //1.创建对象
    //(1)初始化方法
    NSArray *array = [[NSArray alloc] initWithObjects:@"zhengzhou", @"henan", @"yichuan", @"huimian", nil];
    NSLog(@"%@", array);
    //(2)便利构造器
    NSArray *array1 = [NSArray arrayWithObjects:@"henan",@"zhengzhou", @"yichuan", @"fangcheng", nil];
    NSLog(@"%@", array1);
    //或[NSArray arrayWithArray:(NSArray *)]
 
    //(3)笑笑语法
    NSArray *array2 = @[@"apple", @"tea", @"coffee", @"coca"];
    NSLog(@"%@", array2);
    
    //2.数组元素的个数(求字符串长度用length, 求C语言字符串长度用strlen)
    NSUInteger count = [array count];
    NSLog(@"%lu", count);//输出: 4
    //输出NSInteger类型用 %ld

    //3.根据下标访问数组中的元素
    NSString *str1 = [array objectAtIndex:3];
    NSLog(@"%@", str1);
    //(1)获取第一个元素对象
    NSString *str2 = [array firstObject];
    NSString *str3 = [array objectAtIndex:0];
    NSLog(@"%@ %@", str2, str3);
    //firstObject  lastObject 与 objectAtIndex的区别:
    //相同点:都能够获取到数组中的第一个元素
    //不同点:当数组元素个数为 0 时, 前者不会造成程序 crash, 返回值为 NULL 的对象,而后者,直接引起程序 crash
    //(2)获取最后一个元素
    NSString *str4 = [array lastObject];
    NSString *str5 = [array objectAtIndex:[array count] - 1];
    NSLog(@"%@ %@", str4, str5);
    
    //4.判断元素是否存在于数组中
    BOOL isExist = [array containsObject:@"huimian"];
    if (isExist) {
        NSLog(@"存在");
    }else {
        NSLog(@"不存在");
    }
    
    //5.根据数组元素获取该元素相应的下标(第一个找到的下标)
    NSInteger index = [array indexOfObject:@"huimian"];
    NSLog(@"%ld", index);
    
    //6.快速遍历
//    for in 遍历不能在遍历期间修改被遍历集合中的内容,切记!切记!
 
//    for(int i = 0; i < [array count]; i++) {
//        NSLog(@"%@", [array objectAtIndex:i]);
//    }
    
    //输出所有相同类型的元素
    //type *object --- 集合 collection 中存放元素的类型
    //collection --- 集合(OC 中集合,大容器:数组,字典,集合);
    for (NSString *str in array) {
        NSLog(@"%@", str);
    }
    //输出所有不同类型的元素
    for (id str in array) {
        NSLog(@"%@", str);
    }
    
    //练习:定义数组,存储 NSNumber 类型的对象,使用 for in 遍历输出
    NSNumber *num1 = @(7);
    NSNumber *num2 = @('a');
    NSNumber *num3 = @YES;
    NSArray *arrayNum = [NSArray arrayWithObjects:num1, num2, num3, @11, nil];
    for (NSNumber *Num in arrayNum) {
        NSLog(@"%@",  Num);
    }
*/
    /*
    //如何判断NSDictionary是否包含某个键
    //方法一：
    if([[dictionary allKeys] containsObject:key){
        // contains key}
        //方法二：
        if([dictionary objectForKey:key]){ //objectForKey will return nil if a key doesn't exists.
            // contains key}
     */
/*

 //可变数组
    //1.创建可变数组
//    NSMutableArray *mArray = [[NSMutableArray alloc] initWithCapacity:1];
//    NSMutableArray *mArray1 = [NSMutableArray arrayWithCapacity:1];
    NSMutableArray *mArray = [NSMutableArray arrayWithObjects:@"lufei", @"suolong", @"wusuopu", @"namei", nil];
    NSLog(@"%@", mArray);
    NSMutableArray *mArray2 = [@[@"china", @"usa", @"english", @"russia"] mutableCopy];
    NSLog(@"%@", mArray2);
    NSInteger count = [mArray count];
    NSLog(@"%ld", count);
    //2.数组元素个数
    //3.往数组中添加元素
    //(1)添加一个元素
    [mArray addObject:@"japan"];
    NSLog(@"%@", mArray);
    //(2)插入一个元素
    [mArray insertObject:@"dashengguilai" atIndex:2];
    NSLog(@"%@", mArray);
    //4.替换元素
    [mArray replaceObjectAtIndex:2 withObject:@"heimaojingzhang"];
    NSLog(@"%@", mArray);
    //5.交换下标对应的元素
    [mArray exchangeObjectAtIndex:0 withObjectAtIndex:4];
    NSLog(@"%@", mArray);
    //6.移除元素
    //(1)移除指定元素
    [mArray removeObject:@"suolong"];
    NSLog(@"%@", mArray);
    //(2)移除指定下标对应的元素
    [mArray removeObjectAtIndex:0];
    NSLog(@"%@", mArray);
//    //(3)移除所有元素
//    [mArray removeAllObjects];
//    NSLog(@"%@", mArray);
    //7.快速遍历
    for (NSString *str in mArray) {
        NSLog(@"%@", str);
    }
    
    //总结:数组中存储的元素是对象
//    数组存储数据的特点:
//    1.数组中可以存放相同的元素
//    2.数组存放的数据是有序的
//    3.数组中可以存放不同类型的对象(NSString NSNumber NSArray NSDictionary NSDate...)
//    数组使用的场景:当需要一个有序的集合(collection)来管理对象时,就可以使用数组来存储这些对象.
*/

/*
    //图书馆理
    Book *book1 = [Book bookWithName:@"littlePrince" price:7.7];
    Book *book2 = [Book bookWithName:@"theGreatGatsby" price:19.8];
    Book *book3 = [Book bookWithName:@"santi" price:65.5];
    Book *book4 = [Book bookWithName:@"maitianshouwangzhe" price:20.5];
    Book *book5 = [Book bookWithName:@"biancheng" price:25];
    //1.创建可变数组,管理所有图书
    NSMutableArray *bookArray = [NSMutableArray arrayWithObjects:book1, book2, book3, book4, book5, nil];
    NSLog(@"请输入想要执行的操作: 1 --- 添加图书, 2 --- 删除图书, 3 --- 查找书籍(修改价格), 4 --- 显示书籍清单");
    int a = 0;
    scanf("%d", &a);
    switch (a) {
        case 1:
        {
            //添加图书
            //1.获取书名
            NSLog(@"请输入书名:");
            char name[20] = {0};
            scanf("%s", name);
            //2.将C语言的字符串转化为OC 字符串对象
            NSString *bookName = [NSString stringWithUTF8String:name];//参数必须为变量
            NSLog(@"请输入价格:");
            CGFloat price = 0;
            scanf("%lf", &price);//CGfloat 输入用"%lf"
            //3.根据书名和价格来创建图书对象
            Book *newBook = [Book bookWithName:bookName price:price];
            //4.将新的书籍添加到数组中
            [bookArray addObject:newBook];
            for (Book *temp in bookArray) {
                NSLog(@"%@ %.2f", [temp name], [temp price]);
            }
         }
            break;
        case 2:
        {
            //删除图书
            //1.获取书名
            NSLog(@"请输入要删除的图书名");
            char name[20] = {0};
            scanf("%s", name);
            //2.将C语言的字符串转化为OC 字符串对象
            NSString *bookName = [NSString stringWithUTF8String:name];
            //3.根据书名查找数组,然后删除
            //定义变量,记录找到图书的下标
            NSUInteger index = 0;
            for (Book *book in bookArray) {
                //根据书名查找比对
                if ([[book name] isEqualToString:bookName]) {
                   //代码能够至此,说明找到了要找的书
                    //删除
                    //for in 遍历不能在遍历期间修改被遍历集合中的内容,切记!切记!
                    //此时,不能直接删除,因此,迂回战略 --- 记录符合要求的图书下标
                    index = [bookArray indexOfObject:book];//存储符合要求的下标
                }
            }
            //根据记录的下标,删除对应的对象
            [bookArray removeObjectAtIndex:index];
            for (Book *temp in bookArray) {
                NSLog(@"%@ %.2f", [temp name], [temp price]);
            }
        }
            break;
        case 3:
        {
            //查找图书(修改价格)
            NSLog(@"请输入要修改的图书名:");
            char name[20] = {0};
            scanf("%s", name);
            NSString *bookName = [NSString stringWithUTF8String:name];
            NSUInteger index = 0;
            for (Book *temp in bookArray) {
                if ([[temp name] isEqualToString:bookName]) {
                    index = [bookArray indexOfObject:temp];
                }
            }
            Book *temp = [bookArray objectAtIndex:index];
            [temp setPrice:77];
            for (Book *book in bookArray) {
                NSLog(@"%@ %.2f", [book name], [book price]);
            }
        }
            break;
        case 4:
            //显示书籍清单
            for (Book *book in bookArray) {
                NSLog(@"%@ %.2f", book.name, book.price);
            }
            break;

        default:
            break;
    }
*/

//***************************************************************************
/*
    //字典 NSDictionary
    //字典:用来存储具有一一对应关系的数据 ---- 键值对
    //一个 key 对应一个 value ,key 起到唯一标识的作用,key 必须是唯一的,
    //字典中存储的数据是无序的,一个键值对构成字典的一个元素
    //1.创建字典对象
    NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:@"laowang", @"name", @"man", @"gender", @"18", @"age", nil];
    NSLog(@"%@", dic);
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:@"lijiahui", @"name", @"23", @"age", @"70", @"weight", nil];
    NSLog(@"%@", dic1);
    NSDictionary *dic2 = @{@"name":@"lijunyi", @"age":@"21", @"weight":@"50"};
    NSLog(@"%@", dic2);
    //key(NSString * 字符串类型,唯一) --- value(id 泛型对象)
    //2.字典元素个数
    NSUInteger count = [dic count];
    NSLog(@"%ld", count);
    //3.根据 key(字符串,唯一) 获取 value(对象)
    NSString *str = [dic objectForKey:@"name"];
    NSLog(@"%@", str);
    NSString *string = [dic valueForKey:@"name"];
    NSLog(@"%@", string);
    //4.获取所有的key
    NSArray *keyArray = [dic allKeys];
    NSLog(@"%@", keyArray);
    //5.字典遍历
    //字典遍历,获取到的是 key ,然后根据 key 可获得相应的 value值
    for (NSString *key in dic) {
        NSLog(@"%@", [dic valueForKey:key]);
    }
*/
    

    //可变字典 NSMutableDictionary
    //1.创建可变字典对象
    NSMutableDictionary *mDic = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"laowang",@"name", @"18", @"age", @"women", @"gender", nil];
    NSLog(@"%@", mDic);
    NSMutableDictionary *mDic1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"wang", @"name", @"man", @"gender", @"12", @"age", nil];
    NSLog(@"%@", mDic1);
    NSMutableDictionary *mDic2 = [@{@"name":@"li", @"gender":@"man", @"age":@"23"} mutableCopy];
    NSLog(@"%@", mDic2);
/*    //2.往可变字典中添加元素
    [mDic setObject:@"100" forKey:@"weight"];
    NSLog(@"%@", mDic);
    [mDic setValue:@"168" forKey:@"height"];
    NSLog(@"%@", mDic);
    //3.修改 key 对应的 value
    [mDic setValue:@"167" forKey:@"height"];
    NSLog(@"%@", mDic);
    //4.移除
    [mDic removeObjectForKey:@"weight"];
    NSLog(@"%@", mDic);
    [mDic removeAllObjects];
    NSLog(@"%@", mDic);
*/
    
//*****************************************************************************
//
//    //集合 --- NSSet,元素互异,无序
//    //1.创建集合
//    NSSet *set = [[NSSet alloc] initWithObjects:@"aa", @"aa", @"a", @"ll", nil];
//    NSLog(@"%@", set);
//    NSSet *set1 = [NSSet setWithObjects:@"aa", @"aa", @"aaa", @"aab", @"tom", nil];
//    NSLog(@"%@", set1);
//    //2.计算元素个数
//    NSUInteger count = [set count];
//    NSLog(@"%lu", count);
//    //3.获取集合中的元素
//    NSString *str = [set anyObject];
//    NSLog(@"%@", str);
//    //4.遍历
//    for (NSString *se in set) {
//        NSLog(@"%@", se);
//    }
//    
//    //可变集合 --- NSMutableSet
//    //1.创建可变集合
//    NSMutableSet *mSet = [NSMutableSet setWithObjects:@"qq", @"pp", @"sm", @"ss", @"mm", @"cs", @"cs", nil];
//    NSLog(@"%@", mSet);
//    //2.添加
//    [mSet addObject:@"skype"];
//    NSLog(@"%@", mSet);
//    //3.移除
//    [mSet removeObject:@"cs"];
//    NSLog(@"%@", mSet);
//    
//    //计数集合 ---- NSCountedSet
//    //1.创建对象
//    NSCountedSet *countSet = [NSCountedSet setWithObjects:@"junyi", @"jiahui", @"junyi", @"xiaochao", @"junyi", @"Tibet", @"junyi", @"junyi", @"junyi", @"junyi", nil];
//    NSLog(@"%@", countSet);//输出:(jiahui [1], junyi [7], xiaochao [1], Tibet [1])
//    NSUInteger counter = [countSet countForObject:@"junyi"];
//    NSLog(@"%lu", counter);
/**/
    
    //collection(数组 字典 集合) 总结:
    //相同点:都属于 collection (集合 --- 大容器),都可以用于存储多个对象,并且不限制对象的类型
    //不同的://1.作用:
//            数组:数组使用来管理有序的集合
//            字典:用于管理具有一一对应关系的数据的集合
//            集合:用来管理无序性,并且具有互异特点的数据
            //2.特点:
//            数组:有序,并且元素可重复
//            字典:无序,每个元素是一个键值对(一个 key 对应一个 value),切记 key 值唯一
//            集合:无序,互异
            //3.取值方式:
//            数组:根据下标获取对应的元素
//            字典:根据 key 值获取对应的 value
//            集合:anyObject --- 集合效率最大化
            //4.快速遍历:
//            数组:遍历到的是数组中的元素
//            字典:遍历到的是 key 值,根据 key 在字典中查找到 value值
//            集合:遍历到的是集合中的元素
    
    //笑笑语法:
//    NSString *string = @"iPhone";
//    NSMutableString *mString = [@"iPhone" mutableCopy];
//    NSArray *array = @[@"aa", @"bb", @"bbc"];
//    NSMutableArray *mArray = [@[@"bb", @"ll", @"junyi"] mutableCopy];
//    NSDictionary *dic = @{@"name":@"zhangsan", @"age":@18, @"gender":@"man"};
//    NSMutableDictionary *mDic = [@{@"name":@"zhangsan", @"age":@18, @"gender":@"man"} mutableCopy];
//    //获取数组中的元素
//    NSString *str1 = array[0];
//    NSString *str2 = mArray[0];
//    //获取字典中的元素
//    NSString *name = dic[@"name"];
//    NSNumber *age = mDic[@"age"];
    
    return 0;
}
