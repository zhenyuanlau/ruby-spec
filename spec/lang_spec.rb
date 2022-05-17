# frozen_string_literal: true

RSpec.describe '语言' do
  context '基底' do
    context '表示' do
      context '数据' do
        context '值对象' do
          example '立即值' do
            one = 1
            expect(one).to eq 1
          end

          example '特殊值' do
            expect(nil).to eq nil
            expect(true).to eq true
            expect(false).to eq false
            expect(self).to eq self
          end
        end

        example '引用对象' do
          o = Object.new
          expect(o).to eq o
        end
      end

      context '操作' do
        context '方法' do
          context '实例方法' do
          end

          context '单例方法' do
          end

          context '带块方法' do
          end

          context '函数式方法' do
          end
          context '运算符式方法' do
            example '赋值运算' do
              a = 1
              b = 2
              expect([a, b]).to eq [1, 2]
              a, b = b, a
              expect([a, b]).to eq [2, 1]
            end

            example '算术运算' do
              expect(1 + 1).to eq 2
            end

            example '逻辑运算' do
              x = true
              y = false
              z = nil
              n = 0
              expect(x && y).to eq false
              expect(x || y).to eq true
              expect(!z).to eq true
              expect(!n).to eq false
            end

            example '关系运算' do
              expect(1 < 2).to eq true
            end

            example '条件运算' do
              cond = 0
              expect(cond ? true : false).to eq true
            end

            example '范围运算' do
              expect(1...5).to eq Range.new(1, 5, true)
            end

            example '下标运算' do
              a = (1..5).to_a
              expect(a[0]).to eq a.first
            end

            example '匹配运算' do
              expect(/a/ =~ 'abc').to eq 0
            end
          end
        end
      end
    end

    context '构造' do
      example '字面量' do
        h = {}
        a = []
        s = ''
        expect(h).to eq({})
        expect(a).to eq []
        expect(s).to eq String.new
      end

      context '绑定' do
        example '全局变量' do
        end

        example '本地变量' do
          n = 42
          expect(n).to eq 42
        end

        example '实例变量' do
          c = Class.new
          c.class_eval do
            attr_accessor :v

            def initialize(v)
              @v = v
            end
          end
          o = c.new('v')
          expect(o.v).to eq 'v'
        end

        context '类变量' do
          # klass = Class.new
          # klass.class_eval do
          #   @@v = "v"
          # end
        end

        context '特殊变量' do
          example '伪变量' do
            expect(nil).to eq nil
            expect(false).to eq false
            expect(true).to eq true
            expect(self).to eq self
          end

          example '预定义变量' do
          end
        end

        context '常量' do
          example '预定义常量' do
            expect(RUBY_VERSION).to eq '3.1.2'
          end
        end
      end

      example '函数' do
        func = lambda do |x, y|
          x + y
        end
        expect(func.call(1, 2)).to eq 3
      end
    end

    context '解释' do
      example '求值' do
        x = 1
        y = 2
        func = -> { x + y }
        expect(eval('func.call', binding, __FILE__, __LINE__)).to eq 3
      end
    end
  end

  context '抽象' do
    context '数据抽象' do
      context '对象' do
        example '实例' do
          obj = Object.new
          expect(obj.class).to eq Object
          expect(obj.instance_variables).to eq []
        end

        example '类' do
          klass = Class.new
          expect(klass.class).to eq Class
          expect(klass.superclass).to eq Object
          expect(klass.instance_methods(false)).to eq []
          # expect(klass.singleton_class).to eq ?
        end

        example '模块' do
          m = Module.new
          k = Class.new
          m.module_eval do
            def m
              'M#m'
            end
          end
          k.class_eval do
            include m
          end

          o = k.new

          expect(o.m).to eq 'M#m'
        end

        context '可调用对象' do
          context '方法' do
          end

          context '块' do
          end
        end

        context '可运行对象' do
          example '进程' do
          end

          example '线程' do
          end

          example '协程' do
          end
        end
      end
    end

    context '过程抽象' do
      example '方法' do
      end

      example '块' do
      end

      example '带块的方法' do
      end
    end

    context '控制抽象' do
      example '顺序控制' do
      end

      example '条件控制' do
      end

      example '循环控制' do
      end

      example '异常控制' do
      end

      example '执行控制' do
      end

      example '运行控制' do
      end
    end
  end

  context '组合' do
    context '关系' do
      context '结构' do
        context '集合' do
        end
        context '线性结构' do
        end
        context '树形结构' do
        end
        context '图形结构' do
        end
      end

      example '别名' do
      end

      example '继承' do
      end

      context '混入' do
        example 'included' do
        end
        example 'prepend' do
        end

        example 'refine' do
        end
      end
    end

    context '扩展' do
      example '加载' do
      end
    end
  end
end
