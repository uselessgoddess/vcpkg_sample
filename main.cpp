#include <memory>
#include <Platform.Delegates.h>

int main()
{
    auto x = Platform::Delegates::CreateDelegate(std::function([]() {}));
}