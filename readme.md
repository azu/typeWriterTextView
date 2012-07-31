TypeWriter UITextView Subclass.

![image](https://img.skitch.com/20120731-p347e4mp9549pfie4s4fyekggi.png)


    @property(nonatomic, copy) NSString *typeText;// display text
    @property(nonatomic) NSTimeInterval typeInterval;// or typeCharactersPerSec
    @property(nonatomic) NSTimeInterval typeCharactersPerSec;// or typeInterval
    @property(nonatomic, weak) id <TypeWriterTextViewProtocol> typeWriterDelegate;// for delegate
    // protocol
    @optional
    - (void)completeTypingText:(TypeWriterTextView *)typeWriterTextView;


License : MIT

ref . [タイプライター風の表示をするUITextViewのライブラリを書いた | Technology-Gym](http://tech-gym.com/2012/07/ios/844.html "タイプライター風の表示をするUITextViewのライブラリを書いた | Technology-Gym")